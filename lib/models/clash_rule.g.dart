// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clash_rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClashRuleImpl _$$ClashRuleImplFromJson(Map<String, dynamic> json) =>
    _$ClashRuleImpl(
      type: json['type'] as String,
      payload: json['payload'] as String,
      proxy: json['proxy'] as String,
      size: json['size'] as int,
    );

Map<String, dynamic> _$$ClashRuleImplToJson(_$ClashRuleImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'payload': instance.payload,
      'proxy': instance.proxy,
      'size': instance.size,
    };
