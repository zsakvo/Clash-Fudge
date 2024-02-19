import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:clash_fudge/android_app_provider.dart';
import 'package:clash_fudge/models/clash_profile_subscriber.dart';
import 'package:clash_fudge/models/clash_proxy.dart';
import 'package:clash_fudge/request/http.dart';
import 'package:clash_fudge/utils/constant.dart';
import 'package:clash_fudge/utils/log.dart';
import 'package:file_picker/file_picker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yaml_edit/yaml_edit.dart';

import '../app_provider.dart';

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

  refresh() {
    state = const AsyncValue.loading();
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
    // ref.read(appConfigProvider.notifier).updateSubscribers(newArr);
  }

  Future importFromUrl({required String url, required String name}) async {
    state = const AsyncValue.loading();
    // ref.read(appConfigProvider.notifier).updateSubscribers(newArr);
    // update((p0) => newArr);
    state = await AsyncValue.guard(() async {
      final arr = state.value ?? [];
      var sub = await Http.fetchProfile(
          profileDirPath: "$profilePath/yamls",
          subscriber: ClashProfileSubscriber(url: url, name: name, interval: 0, time: DateTime.now()));
      sub = _parseProfile(sub: sub);
      return [...arr, sub];
    });
  }

  importFormFile() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
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
        ref.read(androidAppConfigProvider.notifier).updateSubscribers(newArr);
        // update((p0) => newArr);
      }
      return newArr;
    });
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

final clashProxiesProvider = FutureProvider<(List<ClashProxy>, List<ClashProxy>)>((ref) async {
  final res = await Http.fetchProxies();
  var proxiesValue = res.data['proxies'] as Map<String, dynamic>;
  final List<ClashProxy> proxies = [];
  final List<ClashProxy> groups = [];
  ClashProxy? global;
  for (var element in proxiesValue.values) {
    final proxy = ClashProxy.fromJson(element);
    if (proxy.type == "Compatible" || proxy.name == "default") {
      continue;
    }
    if (proxy.all != null) {
      if (proxy.name == "GLOBAL") {
        global = proxy;
      } else {
        groups.add(proxy);
      }
    } else {
      proxies.add(proxy);
    }
  }
  if (global != null) {
    groups.sort((a, b) => global!.all!.indexOf(a.name) - global.all!.indexOf(b.name));
    groups.add(global);
  }
  return (proxies, groups);
});
