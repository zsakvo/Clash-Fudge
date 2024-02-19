import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:clash_fudge/request/http.dart';
import 'package:clash_fudge/utils/constant.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:local_notifier/local_notifier.dart';
import 'package:path_provider/path_provider.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class GeoipFileNotifier extends AsyncNotifier<File> {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  WebSocketChannel? socket;
  @override
  FutureOr<File> build() async {
    if (kIsDesktop) {
      final mihomoDir = "${Platform.environment['HOME']}/.config/mihomo";
      return File("$mihomoDir/geoip.metadb");
    } else {
      final appSupport = await getApplicationSupportDirectory();
      return File("${appSupport.path}/geoip.metadb");
    }
  }

  upgrade() async {
    if (socket != null) {
      return;
    }
    if (kIsDesktop) {
      LocalNotification(title: "提示", body: "开始更新GEO数据库……").show();
    } else {
      const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
          'Clash-Fudge Geoip File', 'Clash-Fudge Geoip 数据',
          channelDescription: '更新 Geoip 数据',
          channelShowBadge: false,
          importance: Importance.max,
          priority: Priority.high,
          onlyAlertOnce: true,
          showProgress: true,
          indeterminate: true);
      const NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
      await flutterLocalNotificationsPlugin.show(2, 'Geoip Metadata', '正在更新 Geoip 数据文件', notificationDetails,
          payload: '');
    }
    await Http.geo("${Const.appSupportPath}/config.yaml");
    socket!.stream.listen((event) async {
      if (event.toString().contains("update GEO databases successful")) {
        socket!.sink.close(status.goingAway);
        socket = null;
        if (kIsDesktop) {
          LocalNotification(title: "成功", body: "GEO数据库更新成功").show();
        } else {
          flutterLocalNotificationsPlugin.cancel(2);
          const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
              'Clash-Fudge Geoip File', 'Clash-Fudge Geoip 数据',
              channelDescription: '更新 Geoip 数据', importance: Importance.max, priority: Priority.high, ticker: 'ticker');
          const NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
          await flutterLocalNotificationsPlugin.show(
            3,
            '结果',
            'Geoip 数据库更新成功',
            notificationDetails,
          );
        }
        ref.invalidateSelf();
      }
      if (event.toString().contains("can't download")) {
        socket!.sink.close(status.goingAway);
        socket = null;
        if (kIsDesktop) {
          LocalNotification(title: "失败", body: jsonDecode(event)["payload"]).show();
        } else {
          flutterLocalNotificationsPlugin.cancel(2);
          const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
              'Clash-Fudge Geoip File', 'Clash-Fudge Geoip 数据',
              channelDescription: '更新 Geoip 数据', importance: Importance.max, priority: Priority.high, ticker: 'ticker');
          const NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails);
          await flutterLocalNotificationsPlugin.show(
            3,
            '结果',
            'Geoip 数据库更新失败',
            notificationDetails,
          );
        }
      }
    });
  }
}

final geoipFileProvider = AsyncNotifierProvider<GeoipFileNotifier, File>(GeoipFileNotifier.new);
