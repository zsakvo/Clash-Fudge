import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:clash_fudge/android_app_provider.dart';
import 'package:clash_fudge/app_provider.dart';
import 'package:clash_fudge/models/app_config.dart';
import 'package:clash_fudge/models/clash_profile_subscriber.dart';
import 'package:clash_fudge/request/http.dart';
import 'package:clash_fudge/utils/constant.dart';
import 'package:file_picker/file_picker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:local_notifier/local_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:yaml_edit/yaml_edit.dart';
import 'package:web_socket_channel/status.dart' as status;

final dynamic _appConfigProvider = (() {
  if (Platform.isAndroid) {
    return androidAppConfigProvider;
  } else {
    return appConfigProvider;
  }
})();

final clashProfileSubscriberProvider =
    AsyncNotifierProvider.autoDispose<ClashProfileSubscriberNotifier, List<ClashProfileSubscriber>>(
        ClashProfileSubscriberNotifier.new);

class ClashProfileSubscriberNotifier extends AutoDisposeAsyncNotifier<List<ClashProfileSubscriber>> {
  late final String profilePath;
  @override
  FutureOr<List<ClashProfileSubscriber>> build() async {
    var prefs = await SharedPreferences.getInstance();
    profilePath = prefs.getString('profilePath') ?? "${Const.appSupportPath}/profiles";
    final subArr = jsonDecode(File("$profilePath/appConfig.json").readAsStringSync())["subscribers"];
    return subArr.map<ClashProfileSubscriber>((e) => ClashProfileSubscriber.fromJson(e)).toList();
  }

  refresh() async {
    final fileNames = Directory(profilePath)
        .listSync()
        .map((e) => e.path.split("/").last)
        .where((element) => element.endsWith(".yaml"))
        .toList();
    final List<ClashProfileSubscriber> arr = [...state.value ?? []];
    final subscribers = arr.where((element) => element.url == null);
    List<ClashProfileSubscriber> newArr = [];
    for (var sub in subscribers) {
      if (fileNames.contains("${sub.name}.yaml")) {
        newArr.add(sub);
      }
    }
    update((p0) => arr);
    ref.read(appConfigProvider.notifier).updateSubscribers(newArr);
  }

  importFromUrl({required String url, required String name}) async {
    final arr = state.value ?? [];
    var sub = await Http.fetchProfile(
        profileDirPath: "$profilePath/yamls",
        subscriber: ClashProfileSubscriber(url: url, name: name, interval: 0, time: DateTime.now()));
    sub = _parseProfile(sub: sub);
    final newArr = [...arr, sub];
    ref.read(appConfigProvider.notifier).updateSubscribers(newArr);
    update((p0) => newArr);
  }

  importFormFile() async {
    final yamlsPath = "$profilePath/yamls";
    final List<ClashProfileSubscriber> newArr = [...state.value ?? []];
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path!);
      final fileName = file.path.split("/").last;
      file.copySync("$yamlsPath/$fileName");
      final profileName = (fileName.split(".")..removeLast()).join(".");
      final index = newArr.indexWhere((element) => element.name == profileName);
      final newSub = _parseProfile(name: profileName);
      if (index != -1) {
        newArr[index] = newSub;
      } else {
        newArr.add(newSub);
      }
      ref.read(_appConfigProvider.notifier).updateSubscribers(newArr);
      update((p0) => newArr);
    }
  }

  ClashProfileSubscriber _parseProfile({String? name, ClashProfileSubscriber? sub}) {
    late File file;
    if (name != null) {
      file = File("$profilePath/yamls/$name.yaml");
    } else {
      file = File("$profilePath/yamls/${sub!.name}.yaml");
    }
    final ye = YamlEditor(file.readAsStringSync());
    final proxiesNum = (ye.parseAt(["proxies"]) as List).length;
    final rulesNum = (ye.parseAt(["rules"]) as List).length;
    if (name != null) {
      return ClashProfileSubscriber(
          url: null, name: name, interval: 0, time: DateTime.now(), proxiesNum: proxiesNum, rulesNum: rulesNum);
    } else {
      return sub!.copyWith(proxiesNum: proxiesNum, rulesNum: rulesNum);
    }
  }

  renameProfile({
    required String oldName,
    required String newName,
  }) {
    final yamlsPath = "$profilePath/yamls";
    final newArr = state.value ?? [];
    final index = newArr.indexWhere((element) => element.name == oldName);
    if (index != -1) {
      newArr[index] = newArr[index].copyWith(name: newName);
      File("$yamlsPath/$oldName.yaml").renameSync("$yamlsPath/$newName.yaml");
      ref.read(appConfigProvider.notifier).updateSubscribers(newArr);
      ref.read(appConfigProvider.notifier).setCurrentProfile(name: newName);
      update((p0) => newArr);
    }
  }

  removeCurrent() {
    final yamlsPath = "$profilePath/yamls";
    final newArr = state.value ?? [];
    final index = newArr.indexWhere((element) => element.name == ref.read(appConfigProvider).value!.currentProfile);
    final name = newArr[index].name;
    if (index != -1) {
      newArr.removeAt(index);
      File("$yamlsPath/$name.yaml").deleteSync();
      ref.read(appConfigProvider.notifier).updateSubscribers(newArr);
      update((p0) => newArr);
    }
  }
}

final autoStartProvider = Provider<bool>((ref) => ref.watch(appConfigProvider).value!.autoStart);
final allowLanProvider = Provider<bool>((ref) => ref.watch(appConfigProvider).value!.core.allowLan);
final testUrlProvider = Provider<String>((ref) => ref.watch(appConfigProvider).value!.testUrl);
final testTimeoutProvider = Provider<int>((ref) => ref.watch(appConfigProvider).value!.testTimeout);
final logLevelProvider = Provider<LogLevel>((ref) => ref.watch(appConfigProvider).value!.core.logLevel);

class GeoFileNotifier extends AutoDisposeAsyncNotifier<File?> {
  WebSocketChannel? socket;
  @override
  FutureOr<File?> build() {
    ref.onDispose(() {
      socket?.sink.close(status.goingAway);
    });
    final mihomoDir = "${Platform.environment['HOME']}/.config/mihomo";
    final geoipFile = File("$mihomoDir/geoip.metadb");
    return geoipFile.existsSync() ? geoipFile : null;
  }

  fetch() async {
    if (socket != null) {
      return;
    }
    LocalNotification(title: "提示", body: "开始更新GEO数据库……").show();
    socket = WebSocketChannel.connect(Uri.parse("ws://${Const.clashServerUrl}/logs?level=warning"));
    try {
      await Http.geo("${Const.appSupportPath}/config.yaml");
      socket!.stream.listen((event) {
        if (event.toString().contains("update GEO databases successful")) {
          socket!.sink.close(status.goingAway);
          socket = null;
          ref.invalidateSelf();
          LocalNotification(title: "成功", body: "GEO数据库更新成功").show();
        }
        if (event.toString().contains("can't download")) {
          socket!.sink.close(status.goingAway);
          socket = null;
          LocalNotification(title: "失败", body: jsonDecode(event)["payload"]).show();
        }
      });
    } catch (_) {
      // ignore
    }
  }
}

final geoFileProvider = AsyncNotifierProvider.autoDispose<GeoFileNotifier, File?>(GeoFileNotifier.new);

final portProvider = Provider<int>((ref) => ref.watch(appConfigProvider).value!.core.port);
final socksPortProvider = Provider<int>((ref) => ref.watch(appConfigProvider).value!.core.socksPort);
final redirPortProvider = Provider<int>((ref) => ref.watch(appConfigProvider).value!.core.redirPort);
final tproxyPortProvider = Provider<int>((ref) => ref.watch(appConfigProvider).value!.core.tproxyPort);
final mixedPortProvider = Provider<int>((ref) => ref.watch(appConfigProvider).value!.core.mixedPort);
final interfaceNameProvider = Provider<String>((ref) => ref.watch(appConfigProvider).value!.core.interfaceName ?? "");
final ipv6Provider = Provider<bool>((ref) => ref.watch(appConfigProvider).value!.core.ipv6);
final tunProvider = Provider<Tun>((ref) => ref.watch(appConfigProvider).value!.core.tun);

final trayClickProvider = Provider<SysTrayClick>((ref) => ref.watch(appConfigProvider).value!.sysTrayClick);

final profilePathProvider = FutureProvider<String>((ref) async {
  var prefs = await SharedPreferences.getInstance();
  return prefs.getString('profilePath') ?? "${Const.appSupportPath}/profiles";
});

final sysTrayShowProvider = Provider<SysTrayShow>((ref) => ref.watch(appConfigProvider).value!.sysTrayShow);

final versionProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  return await Http.version();
});

final libsProvider = FutureProvider<List<(String, String)>>((ref) async {
  final pubspec = File('pubspec.yaml');
  final yaml = YamlEditor(await pubspec.readAsString());
  final deps = yaml.parseAt(['dependencies']).value;
  final devDeps = yaml.parseAt(['dev_dependencies']).value;
  final List<(String, String)> libs = [];
  deps.forEach((key, value) {
    libs.add((key, value.runtimeType == String ? value : ""));
  });
  devDeps.forEach((key, value) {
    libs.add((key, value.runtimeType == String ? value : ""));
  });
  return libs;
});
