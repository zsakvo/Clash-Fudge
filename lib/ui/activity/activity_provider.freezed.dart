// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChartInfo {
  List<int> get ups => throw _privateConstructorUsedError;
  List<int> get downs => throw _privateConstructorUsedError;
  List<String> get upLabels => throw _privateConstructorUsedError;
  List<String> get downLabels => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChartInfoCopyWith<ChartInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChartInfoCopyWith<$Res> {
  factory $ChartInfoCopyWith(ChartInfo value, $Res Function(ChartInfo) then) =
      _$ChartInfoCopyWithImpl<$Res, ChartInfo>;
  @useResult
  $Res call(
      {List<int> ups,
      List<int> downs,
      List<String> upLabels,
      List<String> downLabels});
}

/// @nodoc
class _$ChartInfoCopyWithImpl<$Res, $Val extends ChartInfo>
    implements $ChartInfoCopyWith<$Res> {
  _$ChartInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ups = null,
    Object? downs = null,
    Object? upLabels = null,
    Object? downLabels = null,
  }) {
    return _then(_value.copyWith(
      ups: null == ups
          ? _value.ups
          : ups // ignore: cast_nullable_to_non_nullable
              as List<int>,
      downs: null == downs
          ? _value.downs
          : downs // ignore: cast_nullable_to_non_nullable
              as List<int>,
      upLabels: null == upLabels
          ? _value.upLabels
          : upLabels // ignore: cast_nullable_to_non_nullable
              as List<String>,
      downLabels: null == downLabels
          ? _value.downLabels
          : downLabels // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChartInfoImplCopyWith<$Res>
    implements $ChartInfoCopyWith<$Res> {
  factory _$$ChartInfoImplCopyWith(
          _$ChartInfoImpl value, $Res Function(_$ChartInfoImpl) then) =
      __$$ChartInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<int> ups,
      List<int> downs,
      List<String> upLabels,
      List<String> downLabels});
}

/// @nodoc
class __$$ChartInfoImplCopyWithImpl<$Res>
    extends _$ChartInfoCopyWithImpl<$Res, _$ChartInfoImpl>
    implements _$$ChartInfoImplCopyWith<$Res> {
  __$$ChartInfoImplCopyWithImpl(
      _$ChartInfoImpl _value, $Res Function(_$ChartInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ups = null,
    Object? downs = null,
    Object? upLabels = null,
    Object? downLabels = null,
  }) {
    return _then(_$ChartInfoImpl(
      ups: null == ups
          ? _value.ups
          : ups // ignore: cast_nullable_to_non_nullable
              as List<int>,
      downs: null == downs
          ? _value.downs
          : downs // ignore: cast_nullable_to_non_nullable
              as List<int>,
      upLabels: null == upLabels
          ? _value.upLabels
          : upLabels // ignore: cast_nullable_to_non_nullable
              as List<String>,
      downLabels: null == downLabels
          ? _value.downLabels
          : downLabels // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$ChartInfoImpl extends _ChartInfo {
  const _$ChartInfoImpl(
      {required this.ups,
      required this.downs,
      required this.upLabels,
      required this.downLabels})
      : super._();

  @override
  final List<int> ups;
  @override
  final List<int> downs;
  @override
  final List<String> upLabels;
  @override
  final List<String> downLabels;

  @override
  String toString() {
    return 'ChartInfo(ups: $ups, downs: $downs, upLabels: $upLabels, downLabels: $downLabels)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChartInfoImpl &&
            const DeepCollectionEquality().equals(other.ups, ups) &&
            const DeepCollectionEquality().equals(other.downs, downs) &&
            const DeepCollectionEquality().equals(other.upLabels, upLabels) &&
            const DeepCollectionEquality()
                .equals(other.downLabels, downLabels));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(ups),
      const DeepCollectionEquality().hash(downs),
      const DeepCollectionEquality().hash(upLabels),
      const DeepCollectionEquality().hash(downLabels));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChartInfoImplCopyWith<_$ChartInfoImpl> get copyWith =>
      __$$ChartInfoImplCopyWithImpl<_$ChartInfoImpl>(this, _$identity);
}

abstract class _ChartInfo extends ChartInfo {
  const factory _ChartInfo(
      {required final List<int> ups,
      required final List<int> downs,
      required final List<String> upLabels,
      required final List<String> downLabels}) = _$ChartInfoImpl;
  const _ChartInfo._() : super._();

  @override
  List<int> get ups;
  @override
  List<int> get downs;
  @override
  List<String> get upLabels;
  @override
  List<String> get downLabels;
  @override
  @JsonKey(ignore: true)
  _$$ChartInfoImplCopyWith<_$ChartInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
