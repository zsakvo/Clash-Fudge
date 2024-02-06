// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clash_connections.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClashConnectionsImpl _$$ClashConnectionsImplFromJson(
        Map<String, dynamic> json) =>
    _$ClashConnectionsImpl(
      downloadTotal: json['downloadTotal'] as int?,
      uploadTotal: json['uploadTotal'] as int?,
      connections: (json['connections'] as List<dynamic>?)
          ?.map((e) => Connections.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ClashConnectionsImplToJson(
        _$ClashConnectionsImpl instance) =>
    <String, dynamic>{
      'downloadTotal': instance.downloadTotal,
      'uploadTotal': instance.uploadTotal,
      'connections': instance.connections?.map((e) => e.toJson()).toList(),
    };

_$ConnectionsImpl _$$ConnectionsImplFromJson(Map<String, dynamic> json) =>
    _$ConnectionsImpl(
      id: json['id'] as String?,
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      upload: json['upload'] as int?,
      download: json['download'] as int?,
      start: json['start'] as String?,
      chains:
          (json['chains'] as List<dynamic>?)?.map((e) => e as String).toList(),
      rule: json['rule'] as String?,
      rulePayload: json['rulePayload'] as String?,
    );

Map<String, dynamic> _$$ConnectionsImplToJson(_$ConnectionsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'metadata': instance.metadata,
      'upload': instance.upload,
      'download': instance.download,
      'start': instance.start,
      'chains': instance.chains,
      'rule': instance.rule,
      'rulePayload': instance.rulePayload,
    };

_$MetadataImpl _$$MetadataImplFromJson(Map<String, dynamic> json) =>
    _$MetadataImpl(
      network: json['network'] as String?,
      type: json['type'] as String?,
      sourceIP: json['sourceIP'] as String?,
      destinationIP: json['destinationIP'] as String?,
      sourcePort: json['sourcePort'] as String?,
      destinationPort: json['destinationPort'] as String?,
      host: json['host'] as String?,
      dnsMode: json['dnsMode'] as String?,
      processPath: json['processPath'] as String?,
      specialProxy: json['specialProxy'] as String?,
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
