import 'dart:convert';

import 'package:clash_fudge/android_app_provider.dart';
import 'package:clash_fudge/models/chart_info.dart';
import 'package:clash_fudge/models/clash_memory.dart';
import 'package:clash_fudge/models/clash_snapshot.dart';
import 'package:clash_fudge/utils/constant.dart';

import 'package:clash_fudge/utils/math.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

final snapshotProvider = StreamProvider.autoDispose<Snapshot>((ref) async* {
  if (ref.watch(androidCoreLoadedProvider).value! > 0) {
    final socket = WebSocketChannel.connect(Uri.parse("ws://${Const.clashServerUrl}/connections"));
    ref.onDispose(() => socket.sink.close(status.goingAway));
    await for (var event in socket.stream) {
      yield Snapshot.fromJson(jsonDecode(event));
    }
  } else {
    yield const Snapshot(downloadTotal: 0, uploadTotal: 0);
  }
});

final chartProvider = FutureProvider.autoDispose<ChartInfo?>((ref) async {
  final Snapshot snapshot = (await ref.watch(snapshotProvider.future));
  if (snapshot.connections == null) {
    return null;
  } else {
    var ups = <int>[];
    var downs = <int>[];
    var upLabels = <String>[];
    var downLabels = <String>[];
    for (var connection in snapshot.connections!) {
      ups.add(connection.upload);
      downs.add(connection.download);
    }
    int maxDown = downs.reduce((value, element) => value > element ? value : element);
    int maxUp = ups.reduce((value, element) => value > element ? value : element);
    int steps = 5;
    int stepDown = maxDown ~/ steps;
    int stepUp = maxUp ~/ steps;
    for (var i = 1; i <= steps; i++) {
      upLabels.add(MathUtil.getFlow(stepUp * i));
      downLabels.add(MathUtil.getFlow(stepDown * i));
    }
    return ChartInfo(ups: ups, downs: downs, upLabels: upLabels, downLabels: downLabels);
  }
});

final clashMemoryProvider = StreamProvider<(String, String)>((ref) async* {
  if (ref.watch(androidCoreLoadedProvider).value! > 0) {
    final socket = WebSocketChannel.connect(Uri.parse("ws://${Const.clashServerUrl}/memory"));
    ref.onDispose(() => socket.sink.close(status.goingAway));
    await for (var event in socket.stream) {
      yield MathUtil.getFlowTuple(ClashMemory.fromJson(jsonDecode(event)).inuse ?? 0);
    }
  } else {
    yield ("0", "B");
  }
});

// final matchProxyDelayProvider = FutureProvider.autoDispose<(String, dynamic)>((ref) async {
//   final proxies = ref.watch(clashProxiesProvider).value?.$2 ?? [];
//   final current = ref.watch(rulesProvider).value?.lastWhereOrNull((element) => element.type == "Match")?.proxy;
//   if (current == null) {
//     return ("--", 0);
//   }
//   final proxy = proxies.lastWhere((element) => element.name == current);
//   String? name = proxy.now ?? proxy.all?.first;
//   bool breakFind = true;
//   proxy:
//   while (true) {
//     for (var proxy in proxies) {
//       if (proxy.name == name) {
//         breakFind = false;
//         name = proxy.now;
//         break;
//       } else {
//         breakFind = true;
//       }
//     }
//     if (breakFind) break proxy;
//   }
//   name ??= "DIRECT";
//   try {
//     final res = await Http.proxyPing(
//         name: name,
//         url: ref.read(androidAppConfigProvider).value!.testUrl,
//         timeout: ref.read(androidAppConfigProvider).value!.testTimeout);
//     return (name, res.data["delay"] ?? 0);
//   } catch (e) {
//     return (name, "--");
//   }
// });
