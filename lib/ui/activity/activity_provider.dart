import 'dart:convert';

import 'package:clash_fudge/app_provider.dart';
import 'package:clash_fudge/models/clash_memory.dart';
import 'package:clash_fudge/models/clash_snapshot.dart';
import 'package:clash_fudge/request/http.dart';
import 'package:clash_fudge/ui/rules/rules_provider.dart';

import 'package:clash_fudge/utils/math.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:collection/collection.dart';

part 'activity_provider.freezed.dart';

final snapshotProvider = StreamProvider.autoDispose<Snapshot>((ref) async* {
  final port = await ref.read(coreLoadedProvider.future);
  final socket = WebSocketChannel.connect(Uri.parse("ws://127.0.0.1:$port/connections"));
  ref.onDispose(() => socket.sink.close(status.goingAway));
  await for (var event in socket.stream) {
    yield Snapshot.fromJson(jsonDecode(event));
  }
});

@Freezed(makeCollectionsUnmodifiable: false)
class ChartInfo with _$ChartInfo {
  const factory ChartInfo({
    required List<int> ups,
    required List<int> downs,
    required List<String> upLabels,
    required List<String> downLabels,
  }) = _ChartInfo;
  const ChartInfo._();
}

final chartProvider = FutureProvider.autoDispose<ChartInfo?>((ref) async {
  return ref.watch(snapshotProvider).whenOrNull(
    data: (data) {
      var ups = <int>[];
      var downs = <int>[];
      var upLabels = <String>[];
      var downLabels = <String>[];
      if (data.connections == null) {
        return ChartInfo(ups: ups, downs: downs, upLabels: upLabels, downLabels: downLabels);
      } else {
        for (var connection in data.connections!) {
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
    },
  );
});

final clashMemoryProvider = StreamProvider<(String, String)>((ref) async* {
  final port = await ref.read(coreLoadedProvider.future);
  final socket = WebSocketChannel.connect(Uri.parse("ws://127.0.0.1:$port/memory"));
  ref.onDispose(() => socket.sink.close(status.goingAway));
  await for (var event in socket.stream) {
    yield MathUtil.getFlowTuple(ClashMemory.fromJson(jsonDecode(event)).inuse ?? 0);
  }
});

final matchProxyDelayProvider = FutureProvider.autoDispose<(String, dynamic)>((ref) async {
  final proxies = ref.watch(clashProxiesProvider).value?.$2 ?? [];
  final current = ref.watch(rulesProvider).value?.lastWhereOrNull((element) => element.type == "Match")?.proxy;
  if (current == null) {
    return ("--", 0);
  }
  final proxy = proxies.lastWhere((element) => element.name == current);
  String? name = proxy.now ?? proxy.all?.first;
  bool breakFind = true;
  proxy:
  while (true) {
    for (var proxy in proxies) {
      if (proxy.name == name) {
        breakFind = false;
        name = proxy.now;
        break;
      } else {
        breakFind = true;
      }
    }
    if (breakFind) break proxy;
  }
  name ??= "DIRECT";
  try {
    final res = await Http.proxyPing(
        name: name,
        url: ref.read(appConfigProvider).value!.testUrl,
        timeout: ref.read(appConfigProvider).value!.testTimeout);
    return (name, res.data["delay"] ?? 0);
  } catch (e) {
    return (name, "--");
  }
});
