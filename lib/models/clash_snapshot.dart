import 'package:freezed_annotation/freezed_annotation.dart';
part 'clash_snapshot.freezed.dart';
part 'clash_snapshot.g.dart';

@freezed
class Snapshot with _$Snapshot {
  const factory Snapshot(
      {required int downloadTotal,
      required int uploadTotal,
      List<Connection>? connections,
      @Default(0) int memory}) = _Snapshot;

  const Snapshot._();

  factory Snapshot.fromJson(Map<String, dynamic> json) => _$SnapshotFromJson(json);
}

@freezed
class Connection with _$Connection {
  @JsonSerializable(explicitToJson: true)
  const factory Connection({
    required String id,
    required int upload,
    required int download,
    required String start,
    required List<String> chains,
    required String rule,
    required String rulePayload,
    required Metadata metadata,
  }) = _Connection;

  const Connection._();

  factory Connection.fromJson(Map<String, dynamic> json) => _$ConnectionFromJson(json);
}

@freezed
class Metadata with _$Metadata {
  const factory Metadata({
    required String network,
    required String type,
    required String sourceIP,
    required String destinationIP,
    required String sourcePort,
    required String destinationPort,
    required String host,
    required String dnsMode,
    required String processPath,
    required String specialProxy,
  }) = _Metadata;

  const Metadata._();

  factory Metadata.fromJson(Map<String, dynamic> json) => _$MetadataFromJson(json);
}
