import 'dart:convert';

import 'package:clash_fudge/enums/type.dart';
import 'package:clash_fudge/models/clash_log.dart';
import 'package:clash_fudge/utils/constant.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'package:web_socket_channel/status.dart' as status;

class LogNotifier extends Notifier<(List<ClashLog>, LogLevel)> {
  WebSocketChannel socket = WebSocketChannel.connect(Uri.parse("ws://${Const.clashServerUrl}/logs?level=info"));

  @override
  (List<ClashLog>, LogLevel) build() {
    _listener();
    ref.onDispose(() {
      socket.sink.close(status.goingAway);
    });
    return (<ClashLog>[], LogLevel.info);
  }

  filter(String level) async {
    await socket.sink.close(status.goingAway);
    socket = WebSocketChannel.connect(Uri.parse("ws://${Const.clashServerUrl}/logs?level=$level"));
    state = ([], LogLevel.values.firstWhere((e) => e.name == level));
    _listener();
  }

  clear() {
    state = ([], state.$2);
  }

  _listener() {
    socket.stream.listen((event) {
      final logs = [...state.$1];
      if (logs.length >= 500) {
        logs.removeLast();
      }
      logs.insert(0, ClashLog.fromJson(jsonDecode(event)));
      state = (logs, state.$2);
    });
  }
}

final logProvider = NotifierProvider<LogNotifier, (List<ClashLog>, LogLevel)>(LogNotifier.new);
