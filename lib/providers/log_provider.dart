import 'dart:convert';

import 'package:clash_fudge/models/clash_log.dart';
import 'package:clash_fudge/utils/constant.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'package:web_socket_channel/status.dart' as status;

class LogNotifier extends Notifier<List<ClashLog>> {
  WebSocketChannel socket = WebSocketChannel.connect(Uri.parse("ws://${Const.clashServerUrl}/logs?level=info"));

  @override
  List<ClashLog> build() {
    _listener();
    ref.onDispose(() {
      socket.sink.close(status.goingAway);
    });
    return [];
  }

  filter(String level) async {
    await socket.sink.close(status.goingAway);
    socket = WebSocketChannel.connect(Uri.parse("ws://${Const.clashServerUrl}/logs?level=$level"));
    state = [];
    _listener();
  }

  clear() {
    state = [];
  }

  _listener() {
    socket.stream.listen((event) {
      if (state.length >= 500) {
        state.removeLast();
      }
      state.insert(0, ClashLog.fromJson(jsonDecode(event)));
      state = [...state];
    });
  }
}

final logProvider = NotifierProvider<LogNotifier, List<ClashLog>>(LogNotifier.new);
