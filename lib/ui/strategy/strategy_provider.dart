import 'package:clash_fudge/app_provider.dart';
import 'package:clash_fudge/models/clash_proxy.dart';
import 'package:clash_fudge/request/http.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StrategyNotifier extends Notifier<(List<ClashProxy>, List<ClashProxy>)> {
  @override
  build() {
    return ref.watch(clashProxiesProvider).value ?? ([], []);
  }

  testProxy(String name) async {
    final url = ref.read(appConfigProvider).value!.testUrl;
    final timeout = ref.read(appConfigProvider).value!.testTimeout;
    Http.proxyPing(name: name, url: url, timeout: timeout).then((res) {
      final delay = res.data["delay"];
      final proxies = state.$1;
      final index = proxies.indexWhere((element) => element.name == name);
      proxies[index] = proxies[index].copyWith(delay: delay);
      state = (proxies, state.$2);
    });
  }

  setProxy({
    required String groupName,
    required String name,
  }) async {
    final res = await Http.changeProxy(group: groupName, name: name);
    if (res) {
      final proxies = state.$1;
      final groups = state.$2;
      final group = groups.firstWhere((element) => element.name == groupName);
      final index = groups.indexOf(group);
      groups[index] = group.copyWith(now: name);
      state = (proxies, groups);
      ref.invalidate(clashProxiesProvider);
    }
  }
}

final strategeyProvider =
    NotifierProvider<StrategyNotifier, (List<ClashProxy>, List<ClashProxy>)>(StrategyNotifier.new);
