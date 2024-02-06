// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clash_proxy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClashProxyImpl _$$ClashProxyImplFromJson(Map<String, dynamic> json) =>
    _$ClashProxyImpl(
      alive: json['alive'] as bool,
      name: json['name'] as String,
      history: json['history'] as List<dynamic>,
      type: json['type'] as String,
      udp: json['udp'] as bool,
      delay: json['delay'] as int?,
      all: (json['all'] as List<dynamic>?)?.map((e) => e as String).toList(),
      now: json['now'] as String?,
    );

Map<String, dynamic> _$$ClashProxyImplToJson(_$ClashProxyImpl instance) =>
    <String, dynamic>{
      'alive': instance.alive,
      'name': instance.name,
      'history': instance.history,
      'type': instance.type,
      'udp': instance.udp,
      'delay': instance.delay,
      'all': instance.all,
      'now': instance.now,
    };
