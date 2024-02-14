import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:clash_fudge/ui/config/config_provider.dart';
import 'package:clash_fudge/ui/rules/rules_provider.dart';
import 'package:clash_fudge/ui/strategy/strategy_provider.dart';
import 'package:clash_fudge/utils/profile.dart';
import 'package:clash_fudge/utils/system.dart';
import 'package:clipboard/clipboard.dart';
import 'package:file_picker/file_picker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:launch_at_startup/launch_at_startup.dart';
import 'package:local_notifier/local_notifier.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:proxy_manager/proxy_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:system_tray/system_tray.dart';

import 'package:url_launcher/url_launcher_string.dart';
import 'package:watcher/watcher.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:window_manager/window_manager.dart';

import 'models/app_config.dart';
import 'models/clash_profile_subscriber.dart';
import 'models/clash_proxy.dart';
import 'models/traffic_speed.dart';
import 'request/http.dart';
import 'utils/constant.dart';
import 'utils/exec.dart';
import 'utils/log.dart';
import 'utils/math.dart';

Future<bool> watchLog() async {
  final Completer<bool> completer = Completer<bool>();
  final File logFile = File(Const.logPath);

  try {
    late StreamSubscription<WatchEvent> watcherSubscription;
    watcherSubscription =
        PollingFileWatcher(Const.logPath, pollingDelay: const Duration(milliseconds: 50)).events.listen((event) async {
      if (await logFile.readAsString().then((content) => content.contains("RESTful API listening at"))) {
        watcherSubscription.cancel();
        completer.complete(true);
      }
    });

    // 设置超时
    Future.delayed(const Duration(seconds: 5), () {
      if (!completer.isCompleted) {
        watcherSubscription.cancel();
        completer.complete(false);
      }
    });

    // 等待完成或超时
    return await completer.future;
  } catch (e) {
    // 处理错误
    return false;
  }
}

final coreLoadedProvider = FutureProvider<bool>((ref) async {
  File(Const.logPath).writeAsStringSync("");
  ClashUtil.execCore();
  return await watchLog();
});

class AppConfigNotifier extends AsyncNotifier<AppConfig> {
  // late final SharedPreferences prefs;
  late File appConfigFile;
  late File clashConfigFile;
  late String profilePath;
  String clashConfigContent = "";
  late StreamSubscription<dynamic> socketListener;
  static ProxyManager manager = ProxyManager();

  @override
  Future<AppConfig> build() async {
    ref.listenSelf((previous, next) async {
      final nextValue = next.value;
      if (nextValue != null) {
        setTrayMenus(ref.read(clashProxiesProvider).value?.$2 ?? []);
        appConfigFile.writeAsStringSync(jsonEncode(nextValue.toJson()));
        final yaml = ClashFudgeProfile(content: clashConfigContent).updateValues(nextValue.core.toJson());
        clashConfigFile.writeAsString(yaml.toString());
      }
    });

    await ref.read(coreLoadedProvider.future);

    SharedPreferences prefs = await SharedPreferences.getInstance();

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    launchAtStartup.setup(
      appName: packageInfo.appName,
      appPath: Platform.resolvedExecutable,
    );
    bool autoStart = await launchAtStartup.isEnabled();
    Const.systemTray.registerSystemTrayEventHandler((eventName) {
      final leftClickEvent = state.value?.sysTrayClick ?? SysTrayClick.window;
      if (eventName == Const.kSystemTrayEventRightClick) {
        Const.systemTray.popUpContextMenu();
      } else if (eventName == Const.kSystemTrayEventClick) {
        if (leftClickEvent == SysTrayClick.window) {
          windowManager.show();
        } else if (leftClickEvent == SysTrayClick.menu) {
          Const.systemTray.popUpContextMenu();
        }
      }
    });
    if (Platform.isMacOS) initSocket();
    profilePath = prefs.getString('profilePath') ?? "${Const.appSupportPath}/profiles";
    final yamlDir = Directory("$profilePath/yamls");
    if (!yamlDir.existsSync()) yamlDir.createSync(recursive: true);
    appConfigFile = File("$profilePath/appConfig.json");
    clashConfigFile = File("${Const.appSupportPath}/config.yaml");
    if (!clashConfigFile.existsSync()) {
      clashConfigFile.createSync(recursive: true);
      clashConfigContent = "generate-time: ${DateTime.now().toString()}";
    } else {
      clashConfigContent = File("${Const.appSupportPath}/config.yaml").readAsStringSync();
    }
    if (!appConfigFile.existsSync()) {
      final initialAppConfig = AppConfig(autoStart: autoStart);
      appConfigFile.createSync(recursive: true);
      appConfigFile.writeAsStringSync(jsonEncode(initialAppConfig.toJson()));
      return initialAppConfig;
    } else {
      final Map<String, dynamic> configMap = jsonDecode(appConfigFile.readAsStringSync());
      configMap['autoStart'] = autoStart;
      if (configMap['sysTrayShow'] != SysTrayShow.all.name) socketListener.pause();
      setCurrentProfile();
      if (configMap['isSysProxy'] == true) {
        final port = configMap['core']['mixed-port'];
        setSysProxy(status: true, updateProfile: false, port: port);
      }
      if (!kIsRoot) {
        configMap['core']['tun']['enable'] = false;
      }
      return AppConfig.fromJson(configMap);
    }
  }

  setSysProxy({bool? status, updateProfile = true, int? port}) {
    final value = status ?? !state.value!.isSysProxy;
    if (value) {
      manager.setAsSystemProxy(ProxyTypes.http, "127.0.0.1", port ?? state.value!.core.mixedPort);
      manager.setAsSystemProxy(ProxyTypes.https, "127.0.0.1", port ?? state.value!.core.mixedPort);
      manager.setAsSystemProxy(ProxyTypes.socks, "127.0.0.1", port ?? state.value!.core.mixedPort);
    } else {
      manager.cleanSystemProxy();
    }
    if (updateProfile) update((state) => state.copyWith(isSysProxy: value));
  }

  setTun({bool? status}) async {
    final value = status ?? !state.value!.core.tun.enable;
    if (value == true) {
      final coreValue = state.value!.core.copyWith(tun: state.value!.core.tun.copyWith(enable: value));
      appConfigFile.writeAsStringSync(jsonEncode(state.value!.copyWith(core: coreValue)));
      clashConfigFile.writeAsStringSync(
          ClashFudgeProfile(content: clashConfigContent).updateValues(coreValue.toJson()).toString());
      if (!kIsRoot && (!await _restartCoreWithRoot() || !await watchLog())) {
        return;
      }
    } else {
      manager.setSystemDns(["Empty"]);
    }
    final core = state.value!.core.copyWith(tun: state.value!.core.tun.copyWith(enable: value));
    update((state) => state.copyWith(core: core));
    await Http.patchConfig(core.toJson());
    Http.flushFakeIp();
    manager.setSystemDns(["192.18.0.2"]);
  }

  changeMode(Mode mode) {
    update((state) => state.copyWith(core: state.core.copyWith(mode: mode)));
  }

  restartCore() async {
    await Http.restartCore("${Const.appSupportPath}/config.yaml");
  }

  flushFakeIp() {
    Http.flushFakeIp();
  }

  reloadProfile() {
    setCurrentProfile();
  }

  setNormalTextFieldVal(Map<String, dynamic> map) {
    final config = state.value!.toJson();
    for (var entry in map.entries) {
      final keyArr = entry.key.split(".");
      var temp = config;
      for (var i = 0; i < keyArr.length; i++) {
        final key = keyArr[i];
        if (i == keyArr.length - 1) {
          if (key == 'mixed-port') {
            if (entry.value == 0) {
              continue;
            } else {
              setSysProxy(status: true, port: entry.value);
            }
          }
          temp[key] = entry.value;
        } else {
          temp = temp[key];
        }
      }
    }
    Http.patchConfig(config['core']);
    update((state) => AppConfig.fromJson(config));
  }

  setCurrentProfile({String? name}) async {
    if (name != null) {
      final path = "$profilePath/yamls/$name.yaml";
      clashConfigContent = File(path).readAsStringSync();
      clashConfigFile.writeAsStringSync(
          ClashFudgeProfile(content: clashConfigContent).updateValues(state.value!.core.toJson()).toString());
      update((state) => state.copyWith(currentProfile: name));
    }
    await Http.changeConfig("${Const.appSupportPath}/config.yaml");
    ref.invalidate(clashProxiesProvider);
    ref.invalidate(rulesProvider);
    // ref.invalidate(matchProxyDelayProvider);
  }

  updateSubscribers(List<ClashProfileSubscriber> subs) {
    update((state) => state.copyWith(subscribers: subs));
  }

  setAutoStart(bool val) async {
    if (val) {
      await launchAtStartup.enable();
    } else {
      await launchAtStartup.disable();
    }
    final isEnabled = await launchAtStartup.isEnabled();
    update((state) => state.copyWith(autoStart: isEnabled));
  }

  setAllowLan(bool val) {
    update((state) => state.copyWith(core: state.core.copyWith(allowLan: val)));
  }

  setLogLevel(LogLevel val) {
    update((state) => state.copyWith(core: state.core.copyWith(logLevel: val)));
  }

  setIpv6(bool val) {
    update((state) => state.copyWith(core: state.core.copyWith(ipv6: val)));
  }

  setTunStack(TunStack val) {
    update((state) => state.copyWith(core: state.core.copyWith(tun: state.core.tun.copyWith(stack: val))));
  }

  openProfileDir() {
    Directory dc = Directory("$profilePath/yamls");
    if (!dc.existsSync()) {
      dc.createSync(recursive: true);
    }
    launchUrlString("file://${dc.path}");
  }

  pickProfilePath() async {
    String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
    if (selectedDirectory != null) {
      Log.e(selectedDirectory);
      Directory(profilePath).listSync().forEach((element) {
        Log.e(element.path);
        element.renameSync("$selectedDirectory/${element.path.split("/").last}");
      });
      final prefs = await SharedPreferences.getInstance();
      profilePath = selectedDirectory;
      prefs.setString('profilePath', selectedDirectory);
      ref.invalidate(profilePathProvider);
      appConfigFile = File("$selectedDirectory/appConfig.json");
    }
  }

  initSocket() {
    final socket = WebSocketChannel.connect(Uri.parse("ws://${Const.clashServerUrl}/traffic"));
    socketListener = socket.stream.listen((event) {
      final ts = TrafficSpeed.fromJson(jsonDecode(event));
      Const.systemTray.setDualTitle(
          downTitle: "${MathUtil.getFlow(ts.down, accuracy: 2)}/s",
          upTitle: "${MathUtil.getFlow(ts.up, accuracy: 2)}/s",
          width: 86,
          iconPath: "assets/icon/systray.png");
    });
  }

  setShowSysTray(SysTrayShow val) async {
    if (val == SysTrayShow.all) {
      socketListener.resume();
    } else {
      socketListener.pause();
      await Const.systemTray.setWidth(24);
      await Const.systemTray.setImage("assets/icon/systray.png");
    }
    update((state) => state.copyWith(sysTrayShow: val));
  }

  setTrayClick(SysTrayClick val) {
    update((state) => state.copyWith(sysTrayClick: val));
  }

  forceRefresh() {
    update((value) => value.copyWith());
  }

  setTrayMenus(List<ClashProxy> selectors) async {
    final appConfig = state.value!;
    final menu = Menu();
    final menus = [
      SubMenu(label: '出站模式', children: [
        MenuItemCheckbox(
          label: '直接连接',
          checked: appConfig.core.mode == Mode.direct,
          onClicked: (menuItemBase) {
            changeMode(Mode.direct);
          },
        ),
        MenuItemCheckbox(
          label: '规则判定',
          checked: appConfig.core.mode == Mode.rule,
          onClicked: (menuItemBase) {
            changeMode(Mode.rule);
          },
        ),
        MenuItemCheckbox(
          label: '全局代理',
          checked: appConfig.core.mode == Mode.global,
          onClicked: (menuItemBase) {
            changeMode(Mode.global);
          },
        ),
      ]),
      MenuSeparator(),
      ...selectors
          .map<SubMenu>((e) => SubMenu(
              label: e.name,
              subLabel: e.now,
              subLabelMaxLength: 232,
              children: (e.all ?? [])
                  .map<MenuItemCheckbox>(
                    (name) => MenuItemCheckbox(
                      label: name,
                      onClicked: (item) {
                        ref.read(strategeyProvider.notifier).setProxy(groupName: e.name, name: name);
                      },
                      checked: e.now == name,
                    ),
                  )
                  .toList()))
          .toList(),
      MenuSeparator(),
      MenuItemCheckbox(
          label: '设置为系统代理',
          onClicked: (item) {
            setSysProxy(status: !item.checked);
          },
          checked: appConfig.isSysProxy),
      MenuItemCheckbox(
          label: 'Tun 模式',
          onClicked: (item) {
            setTun(status: !item.checked);
          },
          checked: appConfig.core.tun.enable),
      MenuItemLabel(
          label: '复制终端命令',
          onClicked: (item) {
            SystemUtil.copyTeminalCommand(appConfig.core.port, appConfig.core.socksPort);
          }),
      MenuSeparator(),
      MenuItemCheckbox(
          label: '开机启动',
          onClicked: (item) {
            setAutoStart(!item.checked);
          },
          checked: appConfig.autoStart),
      MenuItemCheckbox(
          label: '允许局域网连接',
          onClicked: (item) {
            setAllowLan(!item.checked);
          },
          checked: appConfig.core.allowLan),
      MenuItemCheckbox(
          label: '显示网络速率',
          onClicked: (item) {
            setShowSysTray(!item.checked ? SysTrayShow.all : SysTrayShow.icon);
          },
          checked: appConfig.sysTrayShow == SysTrayShow.all),
      MenuSeparator(),
      MenuSeparator(),
      SubMenu(
          label: '配置',
          children: appConfig.subscribers
              .map(
                (e) => MenuItemCheckbox(
                  label: e.name,
                  checked: appConfig.currentProfile == e.name,
                  onClicked: (menuItemBase) {
                    setCurrentProfile(name: menuItemBase.label);
                  },
                ),
              )
              .toList()),
      MenuItemLabel(
        label: '控制台',
        onClicked: (menuItemBase) {
          windowManager.show();
        },
      ),
      MenuItemLabel(
          label: '退出',
          onClicked: (item) async {
            await manager.cleanSystemProxy();
            await manager.setSystemDns(["Empty"]);
            exit(0);
          }),
    ];
    await menu.buildFrom(menus);
    Const.systemTray.setContextMenu(menu);
  }

  Future<bool> _restartCoreWithRoot() async {
    File(Const.logPath).writeAsStringSync("");
    Log.e(Const.execMacOsCoreCommandWithRoot);
    late final ProcessResult res;
    if (Platform.isMacOS) {
      res = await Process.run("/usr/bin/osascript", ["-e", Const.execMacOsCoreCommandWithRoot]);
    } else if (Platform.isLinux) {
      res = await Process.run(
          "pkexec", ['--user', Platform.environment['USER']!, 'sh', '-c', Const.execLinuxCoreCommandWithRoot]);
    }
    Log.e(res.stderr.toString(), "___");
    if (res.stderr.toString().trim().isNotEmpty) {
      LocalNotification(
          title: "启动失败", body: res.stderr.toString().trim(), actions: [LocalNotificationAction(text: "复制")])
        ..onClick = () {
          FlutterClipboard.copy(res.stderr.toString().trim());
        }
        ..show();
      return false;
    }
    kIsRoot = true;
    return true;
  }
}

final appConfigProvider = AsyncNotifierProvider<AppConfigNotifier, AppConfig>(AppConfigNotifier.new);

class ClashProxiesNotifier extends AsyncNotifier<(List<ClashProxy>, List<ClashProxy>)> {
  @override
  FutureOr<(List<ClashProxy>, List<ClashProxy>)> build() async {
    try {
      final proxies = await Http.fetchProxies();
      ref.read(appConfigProvider.notifier).setTrayMenus(proxies.$2);
      return proxies;
    } catch (e) {
      return (<ClashProxy>[], <ClashProxy>[]);
    }
  }
}

final clashProxiesProvider =
    AsyncNotifierProvider<ClashProxiesNotifier, (List<ClashProxy>, List<ClashProxy>)>(ClashProxiesNotifier.new);
