import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:clash_fudge/bridge/android_core.dart';
import 'package:clash_fudge/models/app_config.dart';
import 'package:clash_fudge/models/clash_profile_subscriber.dart';
import 'package:clash_fudge/models/traffic_speed.dart';
import 'package:clash_fudge/providers/clash_profiles_provider.dart';
import 'package:clash_fudge/providers/strategy_provider.dart';
import 'package:clash_fudge/request/http.dart';
import 'package:clash_fudge/utils/constant.dart';
import 'package:clash_fudge/utils/log.dart';
import 'package:clash_fudge/utils/math.dart';
import 'package:clash_fudge/utils/profile.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

final androidCoreLoadedProvider = FutureProvider<int?>((ref) async {
  final appSupportPath = await getApplicationSupportDirectory();
  final geoipFile = File("${appSupportPath.path}/geoip.metadb");
  if (!geoipFile.existsSync()) {
    final bytes = await rootBundle.load("assets/core/geoip.metadb");
    geoipFile.writeAsBytesSync(bytes.buffer.asUint8List());
  }
  Log.i("startup android core...");
  final addr = (await AndroidCore.startRust()) ?? ":-1";
  await AndroidCore.setHomeDir(Const.appSupportPath);
  await AndroidCore.startService();
  Log.i([Const.appSupportPath, addr], 'initial info');
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.requestNotificationsPermission();
  return int.parse(addr.split(":").last);
});

class AndroidAppConfigNotifier extends AsyncNotifier<AppConfig> {
  late File appConfigFile;
  late File clashConfigFile;
  late String profilePath;
  String clashConfigContent = "";
  late StreamSubscription<dynamic> socketListener;

  @override
  Future<AppConfig> build() async {
    ref.listenSelf((previous, next) async {
      final nextValue = next.value;
      if (nextValue != null) {
        appConfigFile.writeAsStringSync(jsonEncode(nextValue.toJson()));
        final yaml = ClashFudgeProfile(content: clashConfigContent).updateValues(nextValue.core.toJson());
        clashConfigFile.writeAsString(yaml.toString());
      }
    });

    // Const.clashPort = (ref.watch(androidCoreLoadedProvider).value!);
    try {
      Const.clashPort = await ref.read(androidCoreLoadedProvider.future) ?? 0;
    } catch (err) {
      Log.e(err);
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool autoStart = false;

    // initSocket();
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
      final initialAppConfig = AppConfig(
          autoStart: autoStart,
          core: ClashConfig(
              interfaceName: null,
              keepAliveInterval: Platform.isAndroid ? 1800 : 30,
              tun: Tun(stack: kDefaultTunStack),
              dns: const Dns(
                enhancedMode: "fake-ip",
              )));
      appConfigFile.createSync(recursive: true);
      appConfigFile.writeAsStringSync(jsonEncode(initialAppConfig.toJson()));
      return initialAppConfig;
    } else {
      final Map<String, dynamic> configMap = jsonDecode(appConfigFile.readAsStringSync());
      (configMap['core'] as Map<String, dynamic>).remove('interface-name');
      configMap['autoStart'] = autoStart;
      if (configMap['sysTrayShow'] != SysTrayShow.all.name) socketListener.pause();
      setCurrentProfile();
      if (Platform.isAndroid) {
        configMap['isSysProxy'] = await AndroidCore.vpnStatus() ?? false;
        Log.e(configMap['isSysProxy'], 'configMap');
      }
      if (configMap['isSysProxy'] == true) {
        // final port = configMap['core']['mixed-port'];
        // setSysProxy(status: true, updateProfile: false, port: port);
      }
      if (!kIsRoot) {
        configMap['core']['tun']['enable'] = false;
      }
      return AppConfig.fromJson(configMap);
    }
  }

  setCurrentProfile({String? name}) async {
    ref.invalidate(clashProxiesProvider);
    if (name != null) {
      final path = "$profilePath/yamls/$name.yaml";
      clashConfigContent = File(path).readAsStringSync();
      clashConfigFile.writeAsStringSync(
          ClashFudgeProfile(content: clashConfigContent).updateValues(state.value!.core.toJson()).toString());
      await update((state) => state.copyWith(currentProfile: name));
      ref.invalidate(clashProxiesProvider);
    }
    await Http.changeConfig("${Const.appSupportPath}/config.yaml");
    // ref.invalidate(clashProxiesProvider);
    // ref.invalidate(matchProxyDelayProvider);
  }

  // setTun({bool? status})async {
  //   final value = status ?? !state.value!.core.tun.enable;
  //   AndroidCore.startVpn();
  // }
  setVpn({bool? status}) async {
    final value = status ?? !state.value!.isSysProxy;
    late dynamic res;
    if (value) {
      res = await AndroidCore.startVpn();
    } else {
      res = await AndroidCore.stopVpn();
    }
    if (res == true) update((state) => state.copyWith(isSysProxy: value));
  }

  updateSubscribers(List<ClashProfileSubscriber> subs) {
    update((state) => state.copyWith(subscribers: subs));
  }
}

final androidAppConfigProvider =
    AsyncNotifierProvider<AndroidAppConfigNotifier, AppConfig>(AndroidAppConfigNotifier.new);

final trafficProvider = StreamProvider<List<(String, String)>>((ref) async* {
  final port = await ref.read(androidCoreLoadedProvider.future);
  final socket = WebSocketChannel.connect(Uri.parse("ws://127.0.0.1:$port/traffic"));
  ref.onDispose(() => socket.sink.close(status.goingAway));
  await for (var event in socket.stream) {
    final ts = TrafficSpeed.fromJson(jsonDecode(event));
    final down = MathUtil.getFlowTuple(
      ts.down,
    );
    final up = MathUtil.getFlowTuple(ts.up);
    yield [up, down];
  }
});

class AppColorNotifier extends AsyncNotifier<int?> {
  late final SharedPreferences sp;
  @override
  FutureOr<int?> build() async {
    sp = await SharedPreferences.getInstance();
    return sp.getInt("app_color");
  }

  setColor(int seed) {
    sp.setInt("app_color", seed);
    update((_) => seed);
  }
}

final appColorProvider = AsyncNotifierProvider<AppColorNotifier, int?>(AppColorNotifier.new);
