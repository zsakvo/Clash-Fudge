// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clash_profile_subscriber.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClashProfileSubscriber _$ClashProfileSubscriberFromJson(
    Map<String, dynamic> json) {
  return _ClashProfileSubscriber.fromJson(json);
}

/// @nodoc
mixin _$ClashProfileSubscriber {
  String? get url => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get interval => throw _privateConstructorUsedError;
  @JsonKey(name: 'userinfo')
  SubUserInfo get userinfo => throw _privateConstructorUsedError;
  DateTime get time => throw _privateConstructorUsedError;
  int? get proxiesNum => throw _privateConstructorUsedError;
  int? get rulesNum => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClashProfileSubscriberCopyWith<ClashProfileSubscriber> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClashProfileSubscriberCopyWith<$Res> {
  factory $ClashProfileSubscriberCopyWith(ClashProfileSubscriber value,
          $Res Function(ClashProfileSubscriber) then) =
      _$ClashProfileSubscriberCopyWithImpl<$Res, ClashProfileSubscriber>;
  @useResult
  $Res call(
      {String? url,
      String name,
      int interval,
      @JsonKey(name: 'userinfo') SubUserInfo userinfo,
      DateTime time,
      int? proxiesNum,
      int? rulesNum});

  $SubUserInfoCopyWith<$Res> get userinfo;
}

/// @nodoc
class _$ClashProfileSubscriberCopyWithImpl<$Res,
        $Val extends ClashProfileSubscriber>
    implements $ClashProfileSubscriberCopyWith<$Res> {
  _$ClashProfileSubscriberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? name = null,
    Object? interval = null,
    Object? userinfo = null,
    Object? time = null,
    Object? proxiesNum = freezed,
    Object? rulesNum = freezed,
  }) {
    return _then(_value.copyWith(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      interval: null == interval
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as int,
      userinfo: null == userinfo
          ? _value.userinfo
          : userinfo // ignore: cast_nullable_to_non_nullable
              as SubUserInfo,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      proxiesNum: freezed == proxiesNum
          ? _value.proxiesNum
          : proxiesNum // ignore: cast_nullable_to_non_nullable
              as int?,
      rulesNum: freezed == rulesNum
          ? _value.rulesNum
          : rulesNum // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SubUserInfoCopyWith<$Res> get userinfo {
    return $SubUserInfoCopyWith<$Res>(_value.userinfo, (value) {
      return _then(_value.copyWith(userinfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ClashProfileSubscriberImplCopyWith<$Res>
    implements $ClashProfileSubscriberCopyWith<$Res> {
  factory _$$ClashProfileSubscriberImplCopyWith(
          _$ClashProfileSubscriberImpl value,
          $Res Function(_$ClashProfileSubscriberImpl) then) =
      __$$ClashProfileSubscriberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? url,
      String name,
      int interval,
      @JsonKey(name: 'userinfo') SubUserInfo userinfo,
      DateTime time,
      int? proxiesNum,
      int? rulesNum});

  @override
  $SubUserInfoCopyWith<$Res> get userinfo;
}

/// @nodoc
class __$$ClashProfileSubscriberImplCopyWithImpl<$Res>
    extends _$ClashProfileSubscriberCopyWithImpl<$Res,
        _$ClashProfileSubscriberImpl>
    implements _$$ClashProfileSubscriberImplCopyWith<$Res> {
  __$$ClashProfileSubscriberImplCopyWithImpl(
      _$ClashProfileSubscriberImpl _value,
      $Res Function(_$ClashProfileSubscriberImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? name = null,
    Object? interval = null,
    Object? userinfo = null,
    Object? time = null,
    Object? proxiesNum = freezed,
    Object? rulesNum = freezed,
  }) {
    return _then(_$ClashProfileSubscriberImpl(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      interval: null == interval
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as int,
      userinfo: null == userinfo
          ? _value.userinfo
          : userinfo // ignore: cast_nullable_to_non_nullable
              as SubUserInfo,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      proxiesNum: freezed == proxiesNum
          ? _value.proxiesNum
          : proxiesNum // ignore: cast_nullable_to_non_nullable
              as int?,
      rulesNum: freezed == rulesNum
          ? _value.rulesNum
          : rulesNum // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ClashProfileSubscriberImpl extends _ClashProfileSubscriber {
  _$ClashProfileSubscriberImpl(
      {required this.url,
      required this.name,
      required this.interval,
      @JsonKey(name: 'userinfo') this.userinfo = const SubUserInfo(),
      required this.time,
      this.proxiesNum,
      this.rulesNum})
      : super._();

  factory _$ClashProfileSubscriberImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClashProfileSubscriberImplFromJson(json);

  @override
  final String? url;
  @override
  final String name;
  @override
  final int interval;
  @override
  @JsonKey(name: 'userinfo')
  final SubUserInfo userinfo;
  @override
  final DateTime time;
  @override
  final int? proxiesNum;
  @override
  final int? rulesNum;

  @override
  String toString() {
    return 'ClashProfileSubscriber(url: $url, name: $name, interval: $interval, userinfo: $userinfo, time: $time, proxiesNum: $proxiesNum, rulesNum: $rulesNum)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClashProfileSubscriberImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.interval, interval) ||
                other.interval == interval) &&
            (identical(other.userinfo, userinfo) ||
                other.userinfo == userinfo) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.proxiesNum, proxiesNum) ||
                other.proxiesNum == proxiesNum) &&
            (identical(other.rulesNum, rulesNum) ||
                other.rulesNum == rulesNum));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, url, name, interval, userinfo, time, proxiesNum, rulesNum);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClashProfileSubscriberImplCopyWith<_$ClashProfileSubscriberImpl>
      get copyWith => __$$ClashProfileSubscriberImplCopyWithImpl<
          _$ClashProfileSubscriberImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClashProfileSubscriberImplToJson(
      this,
    );
  }
}

abstract class _ClashProfileSubscriber extends ClashProfileSubscriber {
  factory _ClashProfileSubscriber(
      {required final String? url,
      required final String name,
      required final int interval,
      @JsonKey(name: 'userinfo') final SubUserInfo userinfo,
      required final DateTime time,
      final int? proxiesNum,
      final int? rulesNum}) = _$ClashProfileSubscriberImpl;
  _ClashProfileSubscriber._() : super._();

  factory _ClashProfileSubscriber.fromJson(Map<String, dynamic> json) =
      _$ClashProfileSubscriberImpl.fromJson;

  @override
  String? get url;
  @override
  String get name;
  @override
  int get interval;
  @override
  @JsonKey(name: 'userinfo')
  SubUserInfo get userinfo;
  @override
  DateTime get time;
  @override
  int? get proxiesNum;
  @override
  int? get rulesNum;
  @override
  @JsonKey(ignore: true)
  _$$ClashProfileSubscriberImplCopyWith<_$ClashProfileSubscriberImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SubUserInfo _$SubUserInfoFromJson(Map<String, dynamic> json) {
  return _SubUserInfo.fromJson(json);
}

/// @nodoc
mixin _$SubUserInfo {
  @JsonKey(name: 'upload')
  int? get upload => throw _privateConstructorUsedError;
  @JsonKey(name: 'download')
  int? get download => throw _privateConstructorUsedError;
  @JsonKey(name: 'total')
  int? get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'expire')
  int? get expire => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubUserInfoCopyWith<SubUserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubUserInfoCopyWith<$Res> {
  factory $SubUserInfoCopyWith(
          SubUserInfo value, $Res Function(SubUserInfo) then) =
      _$SubUserInfoCopyWithImpl<$Res, SubUserInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: 'upload') int? upload,
      @JsonKey(name: 'download') int? download,
      @JsonKey(name: 'total') int? total,
      @JsonKey(name: 'expire') int? expire});
}

/// @nodoc
class _$SubUserInfoCopyWithImpl<$Res, $Val extends SubUserInfo>
    implements $SubUserInfoCopyWith<$Res> {
  _$SubUserInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? upload = freezed,
    Object? download = freezed,
    Object? total = freezed,
    Object? expire = freezed,
  }) {
    return _then(_value.copyWith(
      upload: freezed == upload
          ? _value.upload
          : upload // ignore: cast_nullable_to_non_nullable
              as int?,
      download: freezed == download
          ? _value.download
          : download // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      expire: freezed == expire
          ? _value.expire
          : expire // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubUserInfoImplCopyWith<$Res>
    implements $SubUserInfoCopyWith<$Res> {
  factory _$$SubUserInfoImplCopyWith(
          _$SubUserInfoImpl value, $Res Function(_$SubUserInfoImpl) then) =
      __$$SubUserInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'upload') int? upload,
      @JsonKey(name: 'download') int? download,
      @JsonKey(name: 'total') int? total,
      @JsonKey(name: 'expire') int? expire});
}

/// @nodoc
class __$$SubUserInfoImplCopyWithImpl<$Res>
    extends _$SubUserInfoCopyWithImpl<$Res, _$SubUserInfoImpl>
    implements _$$SubUserInfoImplCopyWith<$Res> {
  __$$SubUserInfoImplCopyWithImpl(
      _$SubUserInfoImpl _value, $Res Function(_$SubUserInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? upload = freezed,
    Object? download = freezed,
    Object? total = freezed,
    Object? expire = freezed,
  }) {
    return _then(_$SubUserInfoImpl(
      upload: freezed == upload
          ? _value.upload
          : upload // ignore: cast_nullable_to_non_nullable
              as int?,
      download: freezed == download
          ? _value.download
          : download // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      expire: freezed == expire
          ? _value.expire
          : expire // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubUserInfoImpl extends _SubUserInfo {
  const _$SubUserInfoImpl(
      {@JsonKey(name: 'upload') this.upload,
      @JsonKey(name: 'download') this.download,
      @JsonKey(name: 'total') this.total,
      @JsonKey(name: 'expire') this.expire})
      : super._();

  factory _$SubUserInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubUserInfoImplFromJson(json);

  @override
  @JsonKey(name: 'upload')
  final int? upload;
  @override
  @JsonKey(name: 'download')
  final int? download;
  @override
  @JsonKey(name: 'total')
  final int? total;
  @override
  @JsonKey(name: 'expire')
  final int? expire;

  @override
  String toString() {
    return 'SubUserInfo(upload: $upload, download: $download, total: $total, expire: $expire)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubUserInfoImpl &&
            (identical(other.upload, upload) || other.upload == upload) &&
            (identical(other.download, download) ||
                other.download == download) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.expire, expire) || other.expire == expire));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, upload, download, total, expire);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubUserInfoImplCopyWith<_$SubUserInfoImpl> get copyWith =>
      __$$SubUserInfoImplCopyWithImpl<_$SubUserInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubUserInfoImplToJson(
      this,
    );
  }
}

abstract class _SubUserInfo extends SubUserInfo {
  const factory _SubUserInfo(
      {@JsonKey(name: 'upload') final int? upload,
      @JsonKey(name: 'download') final int? download,
      @JsonKey(name: 'total') final int? total,
      @JsonKey(name: 'expire') final int? expire}) = _$SubUserInfoImpl;
  const _SubUserInfo._() : super._();

  factory _SubUserInfo.fromJson(Map<String, dynamic> json) =
      _$SubUserInfoImpl.fromJson;

  @override
  @JsonKey(name: 'upload')
  int? get upload;
  @override
  @JsonKey(name: 'download')
  int? get download;
  @override
  @JsonKey(name: 'total')
  int? get total;
  @override
  @JsonKey(name: 'expire')
  int? get expire;
  @override
  @JsonKey(ignore: true)
  _$$SubUserInfoImplCopyWith<_$SubUserInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
