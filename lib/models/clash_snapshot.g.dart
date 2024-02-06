// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clash_snapshot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SnapshotImpl _$$SnapshotImplFromJson(Map<String, dynamic> json) =>
    _$SnapshotImpl(
      downloadTotal: json['downloadTotal'] as int,
      uploadTotal: json['uploadTotal'] as int,
      connections: (json['connections'] as List<dynamic>?)
          ?.map((e) => Connection.fromJson(e as Map<String, dynamic>))
          .toList(),
      memory: json['memory'] as int? ?? 0,
    );

Map<String, dynamic> _$$SnapshotImplToJson(_$SnapshotImpl instance) =>
    <String, dynamic>{
      'downloadTotal': instance.downloadTotal,
      'uploadTotal': instance.uploadTotal,
      'connections': instance.connections,
      'memory': instance.memory,
    };

_$ConnectionImpl _$$ConnectionImplFromJson(Map<String, dynamic> json) =>
    _$ConnectionImpl(
      id: json['id'] as String,
      upload: json['upload'] as int,
      download: json['download'] as int,
      start: json['start'] as String,
      chains:
          (json['chains'] as List<dynamic>).map((e) => e as String).toList(),
      rule: json['rule'] as String,
      rulePayload: json['rulePayload'] as String,
      metadata: Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ConnectionImplToJson(_$ConnectionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'upload': instance.upload,
      'download': instance.download,
      'start': instance.start,
      'chains': instance.chains,
      'rule': instance.rule,
      'rulePayload': instance.rulePayload,
      'metadata': instance.metadata.toJson(),
    };

_$MetadataImpl _$$MetadataImplFromJson(Map<String, dynamic> json) =>
    _$MetadataImpl(
      network: json['network'] as String,
      type: json['type'] as String,
      sourceIP: json['sourceIP'] as String,
      destinationIP: json['destinationIP'] as String,
      sourcePort: json['sourcePort'] as String,
      destinationPort: json['destinationPort'] as String,
      host: json['host'] as String,
      dnsMode: json['dnsMode'] as String,
      processPath: json['processPath'] as String,
      specialProxy: json['specialProxy'] as String,
    );

Map<String, dynamic> _$$MetadataImplToJson(_$MetadataImpl instance) =>
    <String, dynamic>{
      'network': instance.network,
      'type': instance.type,
      'sourceIP': instance.sourceIP,
      'destinationIP': instance.destinationIP,
      'sourcePort': instance.sourcePort,
      'destinationPort': instance.destinationPort,
      'host': instance.host,
      'dnsMode': instance.dnsMode,
      'processPath': instance.processPath,
      'specialProxy': instance.specialProxy,
    };
