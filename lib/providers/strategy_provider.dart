import 'dart:async';

import 'package:clash_fudge/android_app_provider.dart';
import 'package:clash_fudge/models/clash_proxy.dart';
import 'package:clash_fudge/providers/clash_proxies_provider.dart';
import 'package:clash_fudge/request/http.dart';
import 'package:clash_fudge/utils/log.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StrategyNotifier extends AsyncNotifier<(List<ClashProxy>, List<ClashProxy>)> {
  @override
  FutureOr<(List<ClashProxy>, List<ClashProxy>)> build() async {
    return await ref.read(clashProxiesProvider.future);
  }

  testProxy(String name) async {
    final url = ref.read(androidAppConfigProvider).value!.testUrl;
    final timeout = ref.read(androidAppConfigProvider).value!.testTimeout;
    Http.proxyPing(name: name, url: url, timeout: timeout).then((res) {
      final delay = res.data["delay"];
      final proxies = state.value!.$1;
      final index = proxies.indexWhere((element) => element.name == name);
      proxies[index] = proxies[index].copyWith(delay: delay);
      update((p0) => (proxies, p0.$2));
    });
  }

  // testGroupProxy(int groupIndex) async {
  //   final group = state.value!.$2[groupIndex].copyWith(delays: []);
  //   final url = ref.read(androidAppConfigProvider).value!.testUrl;
  //   final timeout = ref.read(androidAppConfigProvider).value!.testTimeout;
  //   final proxies = group.all ?? [];
  //   final map = <String, int>{};
  //   for (var proxy in proxies) {
  //     try {
  //       final res = await Http.proxyPing(name: proxy, url: url, timeout: timeout);
  //       final delay = res.data["delay"];
  //       Log.e(delay);
  //       map[proxy] = int.parse(delay);
  //     } catch (_) {
  //       map[proxy] = -1;
  //     }
  //   }
  //   ref.read(proxyDelayProvider.notifier).state = map;
  // }

  setProxy({
    required String groupName,
    required String name,
  }) async {
    final res = await Http.changeProxy(group: groupName, name: name);
    if (res) {
      final proxies = state.value!.$1;
      final groups = state.value!.$2;
      final group = groups.firstWhere((element) => element.name == groupName);
      final index = groups.indexOf(group);
      groups[index] = group.copyWith(now: name);
      update((_) => (proxies, groups));
      ref.invalidate(clashProxiesProvider);
    }
  }
}

final strategeyProvider =
    AsyncNotifierProvider<StrategyNotifier, (List<ClashProxy>, List<ClashProxy>)>(StrategyNotifier.new);

class ProxyDelayNotifier extends AsyncNotifier<Map<String, int>> {
  @override
  FutureOr<Map<String, int>> build() {
    return {};
  }

  testGroupProxy(List<String>? proxies) async {
    if (proxies == null) return;
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final url = ref.read(androidAppConfigProvider).value!.testUrl;
      final timeout = ref.read(androidAppConfigProvider).value!.testTimeout;
      final map = <String, int>{};
      // return await Future.wait(proxies.map((e) => Http.proxyPing(name: e, url: url, timeout: timeout)
      //         .then((value) => {"name": e, "delay": value.data["delay"]})
      //         .catchError((_) {
      //       return {"name": e, "delay": -1};
      //     }))).then((value) {
      //   for (var res in value) {
      //     final delay = res["delay"];
      //     map[res["name"]] = delay;
      //   }
      //   return map;
      // });
      for (var proxy in proxies) {
        try {
          final res = await Http.proxyPing(name: proxy, url: url, timeout: timeout);
          final delay = res.data["delay"];
          Log.e(delay);
          map[proxy] = delay;
        } catch (_) {
          map[proxy] = -1;
        }
      }
      return map;
    });
  }
}

final proxyDelayProvider = AsyncNotifierProvider<ProxyDelayNotifier, Map<String, int>>(ProxyDelayNotifier.new);
