import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'clash_connections.freezed.dart';
part 'clash_connections.g.dart';

@freezed
class ClashConnections with _$ClashConnections {
  @JsonSerializable(explicitToJson: true)
  const factory ClashConnections({
    @JsonKey(name: 'downloadTotal') int? downloadTotal,
    @JsonKey(name: 'uploadTotal') int? uploadTotal,
    @JsonKey(name: 'connections') List<Connections>? connections,
  }) = _ClashConnections;

  factory ClashConnections.fromJson(Map<String, Object?> json) => _$ClashConnectionsFromJson(json);
}

@freezed
class Connections with _$Connections {
  const factory Connections({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'metadata') Metadata? metadata,
    @JsonKey(name: 'upload') int? upload,
    @JsonKey(name: 'download') int? download,
    @JsonKey(name: 'start') String? start,
    @JsonKey(name: 'chains') List<String>? chains,
    @JsonKey(name: 'rule') String? rule,
    @JsonKey(name: 'rulePayload') String? rulePayload,
  }) = _Connections;

  factory Connections.fromJson(Map<String, Object?> json) => _$ConnectionsFromJson(json);
}

@freezed
class Metadata with _$Metadata {
  const factory Metadata({
    @JsonKey(name: 'network') String? network,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'sourceIP') String? sourceIP,
    @JsonKey(name: 'destinationIP') String? destinationIP,
    @JsonKey(name: 'sourcePort') String? sourcePort,
    @JsonKey(name: 'destinationPort') String? destinationPort,
    @JsonKey(name: 'host') String? host,
    @JsonKey(name: 'dnsMode') String? dnsMode,
    @JsonKey(name: 'processPath') String? processPath,
    @JsonKey(name: 'specialProxy') String? specialProxy,
  }) = _Metadata;

  factory Metadata.fromJson(Map<String, Object?> json) => _$MetadataFromJson(json);
}
