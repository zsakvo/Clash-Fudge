import 'dart:convert';

import 'package:clash_fudge/app_provider.dart';
import 'package:clash_fudge/models/clash_log.dart';
import 'package:clash_fudge/utils/constant.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'package:web_socket_channel/status.dart' as status;

final clashLogsProvider = StreamProvider<ClashLog>((ref) async* {
  final logLevel = (ref.watch(appConfigProvider)).value!.core.logLevel;
  final socket = WebSocketChannel.connect(Uri.parse("ws://${Const.clashServerUrl}/logs??level=$logLevel"));
  ref.onDispose(() => socket.sink.close(status.goingAway));
  await for (var event in socket.stream) {
    yield ClashLog.fromJson(jsonDecode(event));
  }
});
