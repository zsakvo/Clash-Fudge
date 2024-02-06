// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'traffic_speed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TrafficSpeed _$TrafficSpeedFromJson(Map<String, dynamic> json) {
  return _TrafficSpeed.fromJson(json);
}

/// @nodoc
mixin _$TrafficSpeed {
  int get up => throw _privateConstructorUsedError;
  int get down => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrafficSpeedCopyWith<TrafficSpeed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrafficSpeedCopyWith<$Res> {
  factory $TrafficSpeedCopyWith(
          TrafficSpeed value, $Res Function(TrafficSpeed) then) =
      _$TrafficSpeedCopyWithImpl<$Res, TrafficSpeed>;
  @useResult
  $Res call({int up, int down});
}

/// @nodoc
class _$TrafficSpeedCopyWithImpl<$Res, $Val extends TrafficSpeed>
    implements $TrafficSpeedCopyWith<$Res> {
  _$TrafficSpeedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? up = null,
    Object? down = null,
  }) {
    return _then(_value.copyWith(
      up: null == up
          ? _value.up
          : up // ignore: cast_nullable_to_non_nullable
              as int,
      down: null == down
          ? _value.down
          : down // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrafficSpeedImplCopyWith<$Res>
    implements $TrafficSpeedCopyWith<$Res> {
  factory _$$TrafficSpeedImplCopyWith(
          _$TrafficSpeedImpl value, $Res Function(_$TrafficSpeedImpl) then) =
      __$$TrafficSpeedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int up, int down});
}

/// @nodoc
class __$$TrafficSpeedImplCopyWithImpl<$Res>
    extends _$TrafficSpeedCopyWithImpl<$Res, _$TrafficSpeedImpl>
    implements _$$TrafficSpeedImplCopyWith<$Res> {
  __$$TrafficSpeedImplCopyWithImpl(
      _$TrafficSpeedImpl _value, $Res Function(_$TrafficSpeedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? up = null,
    Object? down = null,
  }) {
    return _then(_$TrafficSpeedImpl(
      up: null == up
          ? _value.up
          : up // ignore: cast_nullable_to_non_nullable
              as int,
      down: null == down
          ? _value.down
          : down // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TrafficSpeedImpl extends _TrafficSpeed {
  const _$TrafficSpeedImpl({this.up = 0, this.down = 0}) : super._();

  factory _$TrafficSpeedImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrafficSpeedImplFromJson(json);

  @override
  @JsonKey()
  final int up;
  @override
  @JsonKey()
  final int down;

  @override
  String toString() {
    return 'TrafficSpeed(up: $up, down: $down)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrafficSpeedImpl &&
            (identical(other.up, up) || other.up == up) &&
            (identical(other.down, down) || other.down == down));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, up, down);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrafficSpeedImplCopyWith<_$TrafficSpeedImpl> get copyWith =>
      __$$TrafficSpeedImplCopyWithImpl<_$TrafficSpeedImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrafficSpeedImplToJson(
      this,
    );
  }
}

abstract class _TrafficSpeed extends TrafficSpeed {
  const factory _TrafficSpeed({final int up, final int down}) =
      _$TrafficSpeedImpl;
  const _TrafficSpeed._() : super._();

  factory _TrafficSpeed.fromJson(Map<String, dynamic> json) =
      _$TrafficSpeedImpl.fromJson;

  @override
  int get up;
  @override
  int get down;
  @override
  @JsonKey(ignore: true)
  _$$TrafficSpeedImplCopyWith<_$TrafficSpeedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
