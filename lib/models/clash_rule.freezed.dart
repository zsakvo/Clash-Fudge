// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clash_rule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClashRule _$ClashRuleFromJson(Map<String, dynamic> json) {
  return _ClashRule.fromJson(json);
}

/// @nodoc
mixin _$ClashRule {
  String get type => throw _privateConstructorUsedError;
  String get payload => throw _privateConstructorUsedError;
  String get proxy => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClashRuleCopyWith<ClashRule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClashRuleCopyWith<$Res> {
  factory $ClashRuleCopyWith(ClashRule value, $Res Function(ClashRule) then) =
      _$ClashRuleCopyWithImpl<$Res, ClashRule>;
  @useResult
  $Res call({String type, String payload, String proxy, int size});
}

/// @nodoc
class _$ClashRuleCopyWithImpl<$Res, $Val extends ClashRule>
    implements $ClashRuleCopyWith<$Res> {
  _$ClashRuleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? payload = null,
    Object? proxy = null,
    Object? size = null,
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
      proxy: null == proxy
          ? _value.proxy
          : proxy // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClashRuleImplCopyWith<$Res>
    implements $ClashRuleCopyWith<$Res> {
  factory _$$ClashRuleImplCopyWith(
          _$ClashRuleImpl value, $Res Function(_$ClashRuleImpl) then) =
      __$$ClashRuleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, String payload, String proxy, int size});
}

/// @nodoc
class __$$ClashRuleImplCopyWithImpl<$Res>
    extends _$ClashRuleCopyWithImpl<$Res, _$ClashRuleImpl>
    implements _$$ClashRuleImplCopyWith<$Res> {
  __$$ClashRuleImplCopyWithImpl(
      _$ClashRuleImpl _value, $Res Function(_$ClashRuleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? payload = null,
    Object? proxy = null,
    Object? size = null,
  }) {
    return _then(_$ClashRuleImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      payload: null == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as String,
      proxy: null == proxy
          ? _value.proxy
          : proxy // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClashRuleImpl extends _ClashRule {
  const _$ClashRuleImpl(
      {required this.type,
      required this.payload,
      required this.proxy,
      required this.size})
      : super._();

  factory _$ClashRuleImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClashRuleImplFromJson(json);

  @override
  final String type;
  @override
  final String payload;
  @override
  final String proxy;
  @override
  final int size;

  @override
  String toString() {
    return 'ClashRule(type: $type, payload: $payload, proxy: $proxy, size: $size)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClashRuleImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.payload, payload) || other.payload == payload) &&
            (identical(other.proxy, proxy) || other.proxy == proxy) &&
            (identical(other.size, size) || other.size == size));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, payload, proxy, size);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClashRuleImplCopyWith<_$ClashRuleImpl> get copyWith =>
      __$$ClashRuleImplCopyWithImpl<_$ClashRuleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClashRuleImplToJson(
      this,
    );
  }
}

abstract class _ClashRule extends ClashRule {
  const factory _ClashRule(
      {required final String type,
      required final String payload,
      required final String proxy,
      required final int size}) = _$ClashRuleImpl;
  const _ClashRule._() : super._();

  factory _ClashRule.fromJson(Map<String, dynamic> json) =
      _$ClashRuleImpl.fromJson;

  @override
  String get type;
  @override
  String get payload;
  @override
  String get proxy;
  @override
  int get size;
  @override
  @JsonKey(ignore: true)
  _$$ClashRuleImplCopyWith<_$ClashRuleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
