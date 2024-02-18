import 'dart:async';
import 'dart:convert';

import 'package:clash_fudge/android_app_provider.dart';
import 'package:clash_fudge/bridge/android_core.dart';
import 'package:clash_fudge/models/traffic_speed.dart';
import 'package:clash_fudge/request/http.dart';
import 'package:clash_fudge/utils/constant.dart';
import 'package:clash_fudge/utils/math.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class VpnStatusNotifier extends AsyncNotifier<bool> {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  late StreamSubscription<dynamic> socketListener;
  @override
  FutureOr<bool> build() async {
    return await AndroidCore.vpnStatus() ?? false;
  }

  openVpn() async {
    state = const AsyncValue.loading();
    await Http.flushFakeIp();
    state = await AsyncValue.guard(() async {
      await AndroidCore.startVpn();
      _showVpnNotification();
      return true;
    });
  }

  closeVpn() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await AndroidCore.stopVpn();
      _closeVpnNotification();
      return false;
    });
  }

  toggleVpn() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      if (state.value == true) {
        await AndroidCore.stopVpn();
        _closeVpnNotification();
        return false;
      } else {
        await AndroidCore.startVpn();
        _showVpnNotification();
        return true;
      }
    });
  }

  _closeVpnNotification() async {
    await socketListener.cancel();
    flutterLocalNotificationsPlugin.cancel(1);
  }

  Future<void> _showVpnNotification() async {
    const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails('clash status', 'Clash 状态',
        channelDescription: 'Clash-Fudge Vpn Status',
        importance: Importance.max,
        priority: Priority.high,
        ongoing: true,
        autoCancel: false);
    final title = ref.read(androidAppConfigProvider).value!.currentProfile!;
    const NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
    final WebSocketChannel socket = WebSocketChannel.connect(Uri.parse("ws://${Const.clashServerUrl}/traffic"));
    socketListener = socket.stream.listen((event) {
      final ts = TrafficSpeed.fromJson(jsonDecode(event));
      flutterLocalNotificationsPlugin.show(
          1,
          title,
          '${MathUtil.getFlow(ts.down, accuracy: 2)}/s ↓\t\t${MathUtil.getFlow(ts.up, accuracy: 2)}/s ↑',
          notificationDetails);
    });
  }
}

final vpnStatusProvider = AsyncNotifierProvider<VpnStatusNotifier, bool>(VpnStatusNotifier.new);
