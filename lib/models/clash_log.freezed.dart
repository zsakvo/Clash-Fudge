// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clash_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClashLog _$ClashLogFromJson(Map<String, dynamic> json) {
  return _ClashLog.fromJson(json);
}

/// @nodoc
mixin _$ClashLog {
  String get type => throw _privateConstructorUsedError;
  String get payload => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClashLogCopyWith<ClashLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClashLogCopyWith<$Res> {
  factory $ClashLogCopyWith(ClashLog value, $Res Function(ClashLog) then) =
      _$ClashLogCopyWithImpl<$Res, ClashLog>;
  @useResult
  $Res call({String type, String payload});
}

/// @nodoc
class _$ClashLogCopyWithImpl<$Res, $Val extends ClashLog>
    implements $ClashLogCopyWith<$Res> {
  _$ClashLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? payload = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      payload: null == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClashLogImplCopyWith<$Res>
    implements $ClashLogCopyWith<$Res> {
  factory _$$ClashLogImplCopyWith(
          _$ClashLogImpl value, $Res Function(_$ClashLogImpl) then) =
      __$$ClashLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, String payload});
}

/// @nodoc
class __$$ClashLogImplCopyWithImpl<$Res>
    extends _$ClashLogCopyWithImpl<$Res, _$ClashLogImpl>
    implements _$$ClashLogImplCopyWith<$Res> {
  __$$ClashLogImplCopyWithImpl(
      _$ClashLogImpl _value, $Res Function(_$ClashLogImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? payload = null,
  }) {
    return _then(_$ClashLogImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      payload: null == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClashLogImpl extends _ClashLog {
  const _$ClashLogImpl({required this.type, required this.payload}) : super._();

  factory _$ClashLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClashLogImplFromJson(json);

  @override
  final String type;
  @override
  final String payload;

  @override
  String toString() {
    return 'ClashLog(type: $type, payload: $payload)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClashLogImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.payload, payload) || other.payload == payload));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, payload);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClashLogImplCopyWith<_$ClashLogImpl> get copyWith =>
      __$$ClashLogImplCopyWithImpl<_$ClashLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClashLogImplToJson(
      this,
    );
  }
}

abstract class _ClashLog extends ClashLog {
  const factory _ClashLog(
      {required final String type,
      required final String payload}) = _$ClashLogImpl;
  const _ClashLog._() : super._();

  factory _ClashLog.fromJson(Map<String, dynamic> json) =
      _$ClashLogImpl.fromJson;

  @override
  String get type;
  @override
  String get payload;
  @override
  @JsonKey(ignore: true)
  _$$ClashLogImplCopyWith<_$ClashLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
