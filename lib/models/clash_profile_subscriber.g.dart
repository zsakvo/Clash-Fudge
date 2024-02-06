// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clash_profile_subscriber.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClashProfileSubscriberImpl _$$ClashProfileSubscriberImplFromJson(
        Map<String, dynamic> json) =>
    _$ClashProfileSubscriberImpl(
      url: json['url'] as String?,
      name: json['name'] as String,
      interval: json['interval'] as int,
      userinfo: json['userinfo'] == null
          ? const SubUserInfo()
          : SubUserInfo.fromJson(json['userinfo'] as Map<String, dynamic>),
      time: DateTime.parse(json['time'] as String),
      proxiesNum: json['proxiesNum'] as int?,
      rulesNum: json['rulesNum'] as int?,
    );

Map<String, dynamic> _$$ClashProfileSubscriberImplToJson(
        _$ClashProfileSubscriberImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'name': instance.name,
      'interval': instance.interval,
      'userinfo': instance.userinfo.toJson(),
      'time': instance.time.toIso8601String(),
      'proxiesNum': instance.proxiesNum,
      'rulesNum': instance.rulesNum,
    };

_$SubUserInfoImpl _$$SubUserInfoImplFromJson(Map<String, dynamic> json) =>
    _$SubUserInfoImpl(
      upload: json['upload'] as int?,
      download: json['download'] as int?,
      total: json['total'] as int?,
      expire: json['expire'] as int?,
    );

Map<String, dynamic> _$$SubUserInfoImplToJson(_$SubUserInfoImpl instance) =>
    <String, dynamic>{
      'upload': instance.upload,
      'download': instance.download,
      'total': instance.total,
      'expire': instance.expire,
    };
