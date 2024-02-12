// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clash_proxy.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClashProxy _$ClashProxyFromJson(Map<String, dynamic> json) {
  return _ClashProxy.fromJson(json);
}

/// @nodoc
mixin _$ClashProxy {
  bool get alive => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<dynamic> get history => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  bool get udp => throw _privateConstructorUsedError;
  List<int>? get delays => throw _privateConstructorUsedError;
  int? get delay => throw _privateConstructorUsedError;
  List<String>? get all => throw _privateConstructorUsedError;
  String? get now => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClashProxyCopyWith<ClashProxy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClashProxyCopyWith<$Res> {
  factory $ClashProxyCopyWith(
          ClashProxy value, $Res Function(ClashProxy) then) =
      _$ClashProxyCopyWithImpl<$Res, ClashProxy>;
  @useResult
  $Res call(
      {bool alive,
      String name,
      List<dynamic> history,
      String type,
      bool udp,
      List<int>? delays,
      int? delay,
      List<String>? all,
      String? now});
}

/// @nodoc
class _$ClashProxyCopyWithImpl<$Res, $Val extends ClashProxy>
    implements $ClashProxyCopyWith<$Res> {
  _$ClashProxyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alive = null,
    Object? name = null,
    Object? history = null,
    Object? type = null,
    Object? udp = null,
    Object? delays = freezed,
    Object? delay = freezed,
    Object? all = freezed,
    Object? now = freezed,
  }) {
    return _then(_value.copyWith(
      alive: null == alive
          ? _value.alive
          : alive // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      history: null == history
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      udp: null == udp
          ? _value.udp
          : udp // ignore: cast_nullable_to_non_nullable
              as bool,
      delays: freezed == delays
          ? _value.delays
          : delays // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      delay: freezed == delay
          ? _value.delay
          : delay // ignore: cast_nullable_to_non_nullable
              as int?,
      all: freezed == all
          ? _value.all
          : all // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      now: freezed == now
          ? _value.now
          : now // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClashProxyImplCopyWith<$Res>
    implements $ClashProxyCopyWith<$Res> {
  factory _$$ClashProxyImplCopyWith(
          _$ClashProxyImpl value, $Res Function(_$ClashProxyImpl) then) =
      __$$ClashProxyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool alive,
      String name,
      List<dynamic> history,
      String type,
      bool udp,
      List<int>? delays,
      int? delay,
      List<String>? all,
      String? now});
}

/// @nodoc
class __$$ClashProxyImplCopyWithImpl<$Res>
    extends _$ClashProxyCopyWithImpl<$Res, _$ClashProxyImpl>
    implements _$$ClashProxyImplCopyWith<$Res> {
  __$$ClashProxyImplCopyWithImpl(
      _$ClashProxyImpl _value, $Res Function(_$ClashProxyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alive = null,
    Object? name = null,
    Object? history = null,
    Object? type = null,
    Object? udp = null,
    Object? delays = freezed,
    Object? delay = freezed,
    Object? all = freezed,
    Object? now = freezed,
  }) {
    return _then(_$ClashProxyImpl(
      alive: null == alive
          ? _value.alive
          : alive // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      history: null == history
          ? _value._history
          : history // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      udp: null == udp
          ? _value.udp
          : udp // ignore: cast_nullable_to_non_nullable
              as bool,
      delays: freezed == delays
          ? _value._delays
          : delays // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      delay: freezed == delay
          ? _value.delay
          : delay // ignore: cast_nullable_to_non_nullable
              as int?,
      all: freezed == all
          ? _value._all
          : all // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      now: freezed == now
          ? _value.now
          : now // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ClashProxyImpl extends _ClashProxy {
  const _$ClashProxyImpl(
      {required this.alive,
      required this.name,
      required final List<dynamic> history,
      required this.type,
      required this.udp,
      final List<int>? delays,
      this.delay,
      final List<String>? all,
      this.now})
      : _history = history,
        _delays = delays,
        _all = all,
        super._();

  factory _$ClashProxyImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClashProxyImplFromJson(json);

  @override
  final bool alive;
  @override
  final String name;
  final List<dynamic> _history;
  @override
  List<dynamic> get history {
    if (_history is EqualUnmodifiableListView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_history);
  }

  @override
  final String type;
  @override
  final bool udp;
  final List<int>? _delays;
  @override
  List<int>? get delays {
    final value = _delays;
    if (value == null) return null;
    if (_delays is EqualUnmodifiableListView) return _delays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? delay;
  final List<String>? _all;
  @override
  List<String>? get all {
    final value = _all;
    if (value == null) return null;
    if (_all is EqualUnmodifiableListView) return _all;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? now;

  @override
  String toString() {
    return 'ClashProxy(alive: $alive, name: $name, history: $history, type: $type, udp: $udp, delays: $delays, delay: $delay, all: $all, now: $now)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClashProxyImpl &&
            (identical(other.alive, alive) || other.alive == alive) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._history, _history) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.udp, udp) || other.udp == udp) &&
            const DeepCollectionEquality().equals(other._delays, _delays) &&
            (identical(other.delay, delay) || other.delay == delay) &&
            const DeepCollectionEquality().equals(other._all, _all) &&
            (identical(other.now, now) || other.now == now));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      alive,
      name,
      const DeepCollectionEquality().hash(_history),
      type,
      udp,
      const DeepCollectionEquality().hash(_delays),
      delay,
      const DeepCollectionEquality().hash(_all),
      now);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClashProxyImplCopyWith<_$ClashProxyImpl> get copyWith =>
      __$$ClashProxyImplCopyWithImpl<_$ClashProxyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClashProxyImplToJson(
      this,
    );
  }
}

abstract class _ClashProxy extends ClashProxy {
  const factory _ClashProxy(
      {required final bool alive,
      required final String name,
      required final List<dynamic> history,
      required final String type,
      required final bool udp,
      final List<int>? delays,
      final int? delay,
      final List<String>? all,
      final String? now}) = _$ClashProxyImpl;
  const _ClashProxy._() : super._();

  factory _ClashProxy.fromJson(Map<String, dynamic> json) =
      _$ClashProxyImpl.fromJson;

  @override
  bool get alive;
  @override
  String get name;
  @override
  List<dynamic> get history;
  @override
  String get type;
  @override
  bool get udp;
  @override
  List<int>? get delays;
  @override
  int? get delay;
  @override
  List<String>? get all;
  @override
  String? get now;
  @override
  @JsonKey(ignore: true)
  _$$ClashProxyImplCopyWith<_$ClashProxyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
