import 'dart:async';

import 'package:clash_fudge/bridge/android_core.dart';
import 'package:clash_fudge/request/http.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class VpnStatusNotifier extends AsyncNotifier<bool> {
  @override
  FutureOr<bool> build() async {
    return await AndroidCore.vpnStatus() ?? false;
  }

  openVpn() async {
    state = const AsyncValue.loading();
    await Http.flushFakeIp();
    state = await AsyncValue.guard(() async {
      await AndroidCore.startVpn();
      return true;
    });
  }

  closeVpn() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await AndroidCore.stopVpn();
      return false;
    });
  }

  toggleVpn() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      if (state.value == true) {
        await AndroidCore.stopVpn();
        return false;
      } else {
        await AndroidCore.startVpn();
        return true;
      }
    });
  }
}

final vpnStatusProvider = AsyncNotifierProvider<VpnStatusNotifier, bool>(VpnStatusNotifier.new);
