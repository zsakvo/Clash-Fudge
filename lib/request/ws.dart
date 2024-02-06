import 'package:clash_fudge/models/traffic_speed.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

// Stream<dynamic?> logs(LogLevel? level) {
//     var uri = Uri.parse("ws://127.0.0.1:10048/logs?level=${level ?? ""}");
//     var channel = WebSocketChannel.connect(uri);
//     return channel.stream.map((event) => JsonMapper.deserialize<LogData>(event)?..time = DateTime.now());
//   }

class Ws {
  static Stream<TrafficSpeed?> traffic() {
    var channel = WebSocketChannel.connect(Uri.parse("ws://127.0.0.1:10048/traffic"));
    return channel.stream.map((event) => TrafficSpeed.fromJson(event));
  }
}
