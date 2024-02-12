import 'dart:async';

import 'package:clash_fudge/models/clash_proxy.dart';
import 'package:clash_fudge/request/http.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ClashProxiesNotifier extends AsyncNotifier<(List<ClashProxy>, List<ClashProxy>)> {
  @override
  FutureOr<(List<ClashProxy>, List<ClashProxy>)> build() async {
    final proxies = await Http.fetchProxies();
    return proxies;
  }
}

final clashProxiesProvider =
    AsyncNotifierProvider<ClashProxiesNotifier, (List<ClashProxy>, List<ClashProxy>)>(ClashProxiesNotifier.new);
