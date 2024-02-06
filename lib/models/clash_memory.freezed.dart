// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clash_memory.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClashMemory _$ClashMemoryFromJson(Map<String, dynamic> json) {
  return _ClashMemory.fromJson(json);
}

/// @nodoc
mixin _$ClashMemory {
  @JsonKey(name: 'inuse')
  int? get inuse => throw _privateConstructorUsedError;
  @JsonKey(name: 'oslimit')
  int? get oslimit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClashMemoryCopyWith<ClashMemory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClashMemoryCopyWith<$Res> {
  factory $ClashMemoryCopyWith(
          ClashMemory value, $Res Function(ClashMemory) then) =
      _$ClashMemoryCopyWithImpl<$Res, ClashMemory>;
  @useResult
  $Res call(
      {@JsonKey(name: 'inuse') int? inuse,
      @JsonKey(name: 'oslimit') int? oslimit});
}

/// @nodoc
class _$ClashMemoryCopyWithImpl<$Res, $Val extends ClashMemory>
    implements $ClashMemoryCopyWith<$Res> {
  _$ClashMemoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inuse = freezed,
    Object? oslimit = freezed,
  }) {
    return _then(_value.copyWith(
      inuse: freezed == inuse
          ? _value.inuse
          : inuse // ignore: cast_nullable_to_non_nullable
              as int?,
      oslimit: freezed == oslimit
          ? _value.oslimit
          : oslimit // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClashMemoryImplCopyWith<$Res>
    implements $ClashMemoryCopyWith<$Res> {
  factory _$$ClashMemoryImplCopyWith(
          _$ClashMemoryImpl value, $Res Function(_$ClashMemoryImpl) then) =
      __$$ClashMemoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'inuse') int? inuse,
      @JsonKey(name: 'oslimit') int? oslimit});
}

/// @nodoc
class __$$ClashMemoryImplCopyWithImpl<$Res>
    extends _$ClashMemoryCopyWithImpl<$Res, _$ClashMemoryImpl>
    implements _$$ClashMemoryImplCopyWith<$Res> {
  __$$ClashMemoryImplCopyWithImpl(
      _$ClashMemoryImpl _value, $Res Function(_$ClashMemoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inuse = freezed,
    Object? oslimit = freezed,
  }) {
    return _then(_$ClashMemoryImpl(
      inuse: freezed == inuse
          ? _value.inuse
          : inuse // ignore: cast_nullable_to_non_nullable
              as int?,
      oslimit: freezed == oslimit
          ? _value.oslimit
          : oslimit // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClashMemoryImpl with DiagnosticableTreeMixin implements _ClashMemory {
  const _$ClashMemoryImpl(
      {@JsonKey(name: 'inuse') this.inuse,
      @JsonKey(name: 'oslimit') this.oslimit});

  factory _$ClashMemoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClashMemoryImplFromJson(json);

  @override
  @JsonKey(name: 'inuse')
  final int? inuse;
  @override
  @JsonKey(name: 'oslimit')
  final int? oslimit;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ClashMemory(inuse: $inuse, oslimit: $oslimit)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ClashMemory'))
      ..add(DiagnosticsProperty('inuse', inuse))
      ..add(DiagnosticsProperty('oslimit', oslimit));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClashMemoryImpl &&
            (identical(other.inuse, inuse) || other.inuse == inuse) &&
            (identical(other.oslimit, oslimit) || other.oslimit == oslimit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, inuse, oslimit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClashMemoryImplCopyWith<_$ClashMemoryImpl> get copyWith =>
      __$$ClashMemoryImplCopyWithImpl<_$ClashMemoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClashMemoryImplToJson(
      this,
    );
  }
}

abstract class _ClashMemory implements ClashMemory {
  const factory _ClashMemory(
      {@JsonKey(name: 'inuse') final int? inuse,
      @JsonKey(name: 'oslimit') final int? oslimit}) = _$ClashMemoryImpl;

  factory _ClashMemory.fromJson(Map<String, dynamic> json) =
      _$ClashMemoryImpl.fromJson;

  @override
  @JsonKey(name: 'inuse')
  int? get inuse;
  @override
  @JsonKey(name: 'oslimit')
  int? get oslimit;
  @override
  @JsonKey(ignore: true)
  _$$ClashMemoryImplCopyWith<_$ClashMemoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
