import 'package:freezed_annotation/freezed_annotation.dart';

part 'clash_proxy.freezed.dart';
part 'clash_proxy.g.dart';

@freezed
class ClashProxy with _$ClashProxy {
  @JsonSerializable(explicitToJson: true)
  const factory ClashProxy({
    required bool alive,
    required String name,
    required List<dynamic> history,
    required String type,
    required bool udp,
    int? delay,
    List<String>? all,
    String? now,
  }) = _ClashProxy;
  const ClashProxy._();
  factory ClashProxy.fromJson(Map<String, dynamic> json) => _$ClashProxyFromJson(json);
}
