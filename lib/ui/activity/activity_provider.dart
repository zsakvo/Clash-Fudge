import 'dart:convert';

import 'package:clash_fudge/app_provider.dart';
import 'package:clash_fudge/models/clash_memory.dart';
import 'package:clash_fudge/models/clash_snapshot.dart';
import 'package:clash_fudge/request/http.dart';
import 'package:clash_fudge/ui/rules/rules_provider.dart';
import 'package:clash_fudge/utils/constant.dart';

import 'package:clash_fudge/utils/math.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:collection/collection.dart';

part 'activity_provider.freezed.dart';

final snapshotProvider = StreamProvider.autoDispose<Snapshot>((ref) async* {
  if (ref.watch(coreLoadedProvider)) {
    final socket = WebSocketChannel.connect(Uri.parse("ws://${Const.clashServerUrl}/connections"));
    ref.onDispose(() => socket.sink.close(status.goingAway));
    await for (var event in socket.stream) {
      yield Snapshot.fromJson(jsonDecode(event));
    }
  } else {
    yield const Snapshot(downloadTotal: 0, uploadTotal: 0);
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
  if (ref.watch(coreLoadedProvider)) {
    final socket = WebSocketChannel.connect(Uri.parse("ws://${Const.clashServerUrl}/memory"));
    ref.onDispose(() => socket.sink.close(status.goingAway));
    await for (var event in socket.stream) {
      yield MathUtil.getFlowTuple(ClashMemory.fromJson(jsonDecode(event)).inuse ?? 0);
    }
  } else {
    yield ("0", "B");
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
