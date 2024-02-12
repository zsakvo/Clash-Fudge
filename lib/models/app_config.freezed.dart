// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppConfig _$AppConfigFromJson(Map<String, dynamic> json) {
  return _AppConfig.fromJson(json);
}

/// @nodoc
mixin _$AppConfig {
  String? get currentProfile => throw _privateConstructorUsedError;
  List<ClashProfileSubscriber> get subscribers =>
      throw _privateConstructorUsedError;
  bool get isSysProxy => throw _privateConstructorUsedError;
  bool get autoStart => throw _privateConstructorUsedError;
  String get testUrl => throw _privateConstructorUsedError;
  int get testTimeout => throw _privateConstructorUsedError;
  SysTrayShow get sysTrayShow => throw _privateConstructorUsedError;
  SysTrayClick get sysTrayClick =>
      throw _privateConstructorUsedError; // required String pofilePath,
  ClashConfig get core => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppConfigCopyWith<AppConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppConfigCopyWith<$Res> {
  factory $AppConfigCopyWith(AppConfig value, $Res Function(AppConfig) then) =
      _$AppConfigCopyWithImpl<$Res, AppConfig>;
  @useResult
  $Res call(
      {String? currentProfile,
      List<ClashProfileSubscriber> subscribers,
      bool isSysProxy,
      bool autoStart,
      String testUrl,
      int testTimeout,
      SysTrayShow sysTrayShow,
      SysTrayClick sysTrayClick,
      ClashConfig core});

  $ClashConfigCopyWith<$Res> get core;
}

/// @nodoc
class _$AppConfigCopyWithImpl<$Res, $Val extends AppConfig>
    implements $AppConfigCopyWith<$Res> {
  _$AppConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentProfile = freezed,
    Object? subscribers = null,
    Object? isSysProxy = null,
    Object? autoStart = null,
    Object? testUrl = null,
    Object? testTimeout = null,
    Object? sysTrayShow = null,
    Object? sysTrayClick = null,
    Object? core = null,
  }) {
    return _then(_value.copyWith(
      currentProfile: freezed == currentProfile
          ? _value.currentProfile
          : currentProfile // ignore: cast_nullable_to_non_nullable
              as String?,
      subscribers: null == subscribers
          ? _value.subscribers
          : subscribers // ignore: cast_nullable_to_non_nullable
              as List<ClashProfileSubscriber>,
      isSysProxy: null == isSysProxy
          ? _value.isSysProxy
          : isSysProxy // ignore: cast_nullable_to_non_nullable
              as bool,
      autoStart: null == autoStart
          ? _value.autoStart
          : autoStart // ignore: cast_nullable_to_non_nullable
              as bool,
      testUrl: null == testUrl
          ? _value.testUrl
          : testUrl // ignore: cast_nullable_to_non_nullable
              as String,
      testTimeout: null == testTimeout
          ? _value.testTimeout
          : testTimeout // ignore: cast_nullable_to_non_nullable
              as int,
      sysTrayShow: null == sysTrayShow
          ? _value.sysTrayShow
          : sysTrayShow // ignore: cast_nullable_to_non_nullable
              as SysTrayShow,
      sysTrayClick: null == sysTrayClick
          ? _value.sysTrayClick
          : sysTrayClick // ignore: cast_nullable_to_non_nullable
              as SysTrayClick,
      core: null == core
          ? _value.core
          : core // ignore: cast_nullable_to_non_nullable
              as ClashConfig,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ClashConfigCopyWith<$Res> get core {
    return $ClashConfigCopyWith<$Res>(_value.core, (value) {
      return _then(_value.copyWith(core: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppConfigImplCopyWith<$Res>
    implements $AppConfigCopyWith<$Res> {
  factory _$$AppConfigImplCopyWith(
          _$AppConfigImpl value, $Res Function(_$AppConfigImpl) then) =
      __$$AppConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? currentProfile,
      List<ClashProfileSubscriber> subscribers,
      bool isSysProxy,
      bool autoStart,
      String testUrl,
      int testTimeout,
      SysTrayShow sysTrayShow,
      SysTrayClick sysTrayClick,
      ClashConfig core});

  @override
  $ClashConfigCopyWith<$Res> get core;
}

/// @nodoc
class __$$AppConfigImplCopyWithImpl<$Res>
    extends _$AppConfigCopyWithImpl<$Res, _$AppConfigImpl>
    implements _$$AppConfigImplCopyWith<$Res> {
  __$$AppConfigImplCopyWithImpl(
      _$AppConfigImpl _value, $Res Function(_$AppConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentProfile = freezed,
    Object? subscribers = null,
    Object? isSysProxy = null,
    Object? autoStart = null,
    Object? testUrl = null,
    Object? testTimeout = null,
    Object? sysTrayShow = null,
    Object? sysTrayClick = null,
    Object? core = null,
  }) {
    return _then(_$AppConfigImpl(
      currentProfile: freezed == currentProfile
          ? _value.currentProfile
          : currentProfile // ignore: cast_nullable_to_non_nullable
              as String?,
      subscribers: null == subscribers
          ? _value._subscribers
          : subscribers // ignore: cast_nullable_to_non_nullable
              as List<ClashProfileSubscriber>,
      isSysProxy: null == isSysProxy
          ? _value.isSysProxy
          : isSysProxy // ignore: cast_nullable_to_non_nullable
              as bool,
      autoStart: null == autoStart
          ? _value.autoStart
          : autoStart // ignore: cast_nullable_to_non_nullable
              as bool,
      testUrl: null == testUrl
          ? _value.testUrl
          : testUrl // ignore: cast_nullable_to_non_nullable
              as String,
      testTimeout: null == testTimeout
          ? _value.testTimeout
          : testTimeout // ignore: cast_nullable_to_non_nullable
              as int,
      sysTrayShow: null == sysTrayShow
          ? _value.sysTrayShow
          : sysTrayShow // ignore: cast_nullable_to_non_nullable
              as SysTrayShow,
      sysTrayClick: null == sysTrayClick
          ? _value.sysTrayClick
          : sysTrayClick // ignore: cast_nullable_to_non_nullable
              as SysTrayClick,
      core: null == core
          ? _value.core
          : core // ignore: cast_nullable_to_non_nullable
              as ClashConfig,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$AppConfigImpl extends _AppConfig {
  const _$AppConfigImpl(
      {this.currentProfile,
      final List<ClashProfileSubscriber> subscribers = const [],
      this.isSysProxy = false,
      this.autoStart = false,
      this.testUrl = "http://connect.rom.miui.com/generate_204",
      this.testTimeout = 5,
      this.sysTrayShow = SysTrayShow.all,
      this.sysTrayClick = SysTrayClick.menu,
      this.core = const ClashConfig()})
      : _subscribers = subscribers,
        super._();

  factory _$AppConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppConfigImplFromJson(json);

  @override
  final String? currentProfile;
  final List<ClashProfileSubscriber> _subscribers;
  @override
  @JsonKey()
  List<ClashProfileSubscriber> get subscribers {
    if (_subscribers is EqualUnmodifiableListView) return _subscribers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subscribers);
  }

  @override
  @JsonKey()
  final bool isSysProxy;
  @override
  @JsonKey()
  final bool autoStart;
  @override
  @JsonKey()
  final String testUrl;
  @override
  @JsonKey()
  final int testTimeout;
  @override
  @JsonKey()
  final SysTrayShow sysTrayShow;
  @override
  @JsonKey()
  final SysTrayClick sysTrayClick;
// required String pofilePath,
  @override
  @JsonKey()
  final ClashConfig core;

  @override
  String toString() {
    return 'AppConfig(currentProfile: $currentProfile, subscribers: $subscribers, isSysProxy: $isSysProxy, autoStart: $autoStart, testUrl: $testUrl, testTimeout: $testTimeout, sysTrayShow: $sysTrayShow, sysTrayClick: $sysTrayClick, core: $core)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppConfigImpl &&
            (identical(other.currentProfile, currentProfile) ||
                other.currentProfile == currentProfile) &&
            const DeepCollectionEquality()
                .equals(other._subscribers, _subscribers) &&
            (identical(other.isSysProxy, isSysProxy) ||
                other.isSysProxy == isSysProxy) &&
            (identical(other.autoStart, autoStart) ||
                other.autoStart == autoStart) &&
            (identical(other.testUrl, testUrl) || other.testUrl == testUrl) &&
            (identical(other.testTimeout, testTimeout) ||
                other.testTimeout == testTimeout) &&
            (identical(other.sysTrayShow, sysTrayShow) ||
                other.sysTrayShow == sysTrayShow) &&
            (identical(other.sysTrayClick, sysTrayClick) ||
                other.sysTrayClick == sysTrayClick) &&
            (identical(other.core, core) || other.core == core));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentProfile,
      const DeepCollectionEquality().hash(_subscribers),
      isSysProxy,
      autoStart,
      testUrl,
      testTimeout,
      sysTrayShow,
      sysTrayClick,
      core);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppConfigImplCopyWith<_$AppConfigImpl> get copyWith =>
      __$$AppConfigImplCopyWithImpl<_$AppConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppConfigImplToJson(
      this,
    );
  }
}

abstract class _AppConfig extends AppConfig {
  const factory _AppConfig(
      {final String? currentProfile,
      final List<ClashProfileSubscriber> subscribers,
      final bool isSysProxy,
      final bool autoStart,
      final String testUrl,
      final int testTimeout,
      final SysTrayShow sysTrayShow,
      final SysTrayClick sysTrayClick,
      final ClashConfig core}) = _$AppConfigImpl;
  const _AppConfig._() : super._();

  factory _AppConfig.fromJson(Map<String, dynamic> json) =
      _$AppConfigImpl.fromJson;

  @override
  String? get currentProfile;
  @override
  List<ClashProfileSubscriber> get subscribers;
  @override
  bool get isSysProxy;
  @override
  bool get autoStart;
  @override
  String get testUrl;
  @override
  int get testTimeout;
  @override
  SysTrayShow get sysTrayShow;
  @override
  SysTrayClick get sysTrayClick;
  @override // required String pofilePath,
  ClashConfig get core;
  @override
  @JsonKey(ignore: true)
  _$$AppConfigImplCopyWith<_$AppConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClashConfig _$ClashConfigFromJson(Map<String, dynamic> json) {
  return _ClashConfig.fromJson(json);
}

/// @nodoc
mixin _$ClashConfig {
  bool get ipv6 => throw _privateConstructorUsedError;
  @JsonKey(name: 'mode')
  Mode get mode => throw _privateConstructorUsedError;
  @JsonKey(name: "mixed-port")
  int get mixedPort => throw _privateConstructorUsedError;
  @JsonKey(name: "port")
  int get port => throw _privateConstructorUsedError;
  @JsonKey(name: "socks-port")
  int get socksPort => throw _privateConstructorUsedError;
  @JsonKey(name: 'redir-port')
  int get redirPort => throw _privateConstructorUsedError;
  @JsonKey(name: 'tproxy-port')
  int get tproxyPort => throw _privateConstructorUsedError;
  @JsonKey(name: 'allow-lan')
  bool get allowLan => throw _privateConstructorUsedError;
  @JsonKey(name: 'log-level')
  LogLevel get logLevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'tun')
  Tun get tun => throw _privateConstructorUsedError;
  @JsonKey(name: 'interface-name')
  String? get interfaceName => throw _privateConstructorUsedError;
  @JsonKey(name: 'dns')
  Dns get dns => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClashConfigCopyWith<ClashConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClashConfigCopyWith<$Res> {
  factory $ClashConfigCopyWith(
          ClashConfig value, $Res Function(ClashConfig) then) =
      _$ClashConfigCopyWithImpl<$Res, ClashConfig>;
  @useResult
  $Res call(
      {bool ipv6,
      @JsonKey(name: 'mode') Mode mode,
      @JsonKey(name: "mixed-port") int mixedPort,
      @JsonKey(name: "port") int port,
      @JsonKey(name: "socks-port") int socksPort,
      @JsonKey(name: 'redir-port') int redirPort,
      @JsonKey(name: 'tproxy-port') int tproxyPort,
      @JsonKey(name: 'allow-lan') bool allowLan,
      @JsonKey(name: 'log-level') LogLevel logLevel,
      @JsonKey(name: 'tun') Tun tun,
      @JsonKey(name: 'interface-name') String? interfaceName,
      @JsonKey(name: 'dns') Dns dns});

  $TunCopyWith<$Res> get tun;
  $DnsCopyWith<$Res> get dns;
}

/// @nodoc
class _$ClashConfigCopyWithImpl<$Res, $Val extends ClashConfig>
    implements $ClashConfigCopyWith<$Res> {
  _$ClashConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ipv6 = null,
    Object? mode = null,
    Object? mixedPort = null,
    Object? port = null,
    Object? socksPort = null,
    Object? redirPort = null,
    Object? tproxyPort = null,
    Object? allowLan = null,
    Object? logLevel = null,
    Object? tun = null,
    Object? interfaceName = freezed,
    Object? dns = null,
  }) {
    return _then(_value.copyWith(
      ipv6: null == ipv6
          ? _value.ipv6
          : ipv6 // ignore: cast_nullable_to_non_nullable
              as bool,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as Mode,
      mixedPort: null == mixedPort
          ? _value.mixedPort
          : mixedPort // ignore: cast_nullable_to_non_nullable
              as int,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      socksPort: null == socksPort
          ? _value.socksPort
          : socksPort // ignore: cast_nullable_to_non_nullable
              as int,
      redirPort: null == redirPort
          ? _value.redirPort
          : redirPort // ignore: cast_nullable_to_non_nullable
              as int,
      tproxyPort: null == tproxyPort
          ? _value.tproxyPort
          : tproxyPort // ignore: cast_nullable_to_non_nullable
              as int,
      allowLan: null == allowLan
          ? _value.allowLan
          : allowLan // ignore: cast_nullable_to_non_nullable
              as bool,
      logLevel: null == logLevel
          ? _value.logLevel
          : logLevel // ignore: cast_nullable_to_non_nullable
              as LogLevel,
      tun: null == tun
          ? _value.tun
          : tun // ignore: cast_nullable_to_non_nullable
              as Tun,
      interfaceName: freezed == interfaceName
          ? _value.interfaceName
          : interfaceName // ignore: cast_nullable_to_non_nullable
              as String?,
      dns: null == dns
          ? _value.dns
          : dns // ignore: cast_nullable_to_non_nullable
              as Dns,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TunCopyWith<$Res> get tun {
    return $TunCopyWith<$Res>(_value.tun, (value) {
      return _then(_value.copyWith(tun: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DnsCopyWith<$Res> get dns {
    return $DnsCopyWith<$Res>(_value.dns, (value) {
      return _then(_value.copyWith(dns: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ClashConfigImplCopyWith<$Res>
    implements $ClashConfigCopyWith<$Res> {
  factory _$$ClashConfigImplCopyWith(
          _$ClashConfigImpl value, $Res Function(_$ClashConfigImpl) then) =
      __$$ClashConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool ipv6,
      @JsonKey(name: 'mode') Mode mode,
      @JsonKey(name: "mixed-port") int mixedPort,
      @JsonKey(name: "port") int port,
      @JsonKey(name: "socks-port") int socksPort,
      @JsonKey(name: 'redir-port') int redirPort,
      @JsonKey(name: 'tproxy-port') int tproxyPort,
      @JsonKey(name: 'allow-lan') bool allowLan,
      @JsonKey(name: 'log-level') LogLevel logLevel,
      @JsonKey(name: 'tun') Tun tun,
      @JsonKey(name: 'interface-name') String? interfaceName,
      @JsonKey(name: 'dns') Dns dns});

  @override
  $TunCopyWith<$Res> get tun;
  @override
  $DnsCopyWith<$Res> get dns;
}

/// @nodoc
class __$$ClashConfigImplCopyWithImpl<$Res>
    extends _$ClashConfigCopyWithImpl<$Res, _$ClashConfigImpl>
    implements _$$ClashConfigImplCopyWith<$Res> {
  __$$ClashConfigImplCopyWithImpl(
      _$ClashConfigImpl _value, $Res Function(_$ClashConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ipv6 = null,
    Object? mode = null,
    Object? mixedPort = null,
    Object? port = null,
    Object? socksPort = null,
    Object? redirPort = null,
    Object? tproxyPort = null,
    Object? allowLan = null,
    Object? logLevel = null,
    Object? tun = null,
    Object? interfaceName = freezed,
    Object? dns = null,
  }) {
    return _then(_$ClashConfigImpl(
      ipv6: null == ipv6
          ? _value.ipv6
          : ipv6 // ignore: cast_nullable_to_non_nullable
              as bool,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as Mode,
      mixedPort: null == mixedPort
          ? _value.mixedPort
          : mixedPort // ignore: cast_nullable_to_non_nullable
              as int,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      socksPort: null == socksPort
          ? _value.socksPort
          : socksPort // ignore: cast_nullable_to_non_nullable
              as int,
      redirPort: null == redirPort
          ? _value.redirPort
          : redirPort // ignore: cast_nullable_to_non_nullable
              as int,
      tproxyPort: null == tproxyPort
          ? _value.tproxyPort
          : tproxyPort // ignore: cast_nullable_to_non_nullable
              as int,
      allowLan: null == allowLan
          ? _value.allowLan
          : allowLan // ignore: cast_nullable_to_non_nullable
              as bool,
      logLevel: null == logLevel
          ? _value.logLevel
          : logLevel // ignore: cast_nullable_to_non_nullable
              as LogLevel,
      tun: null == tun
          ? _value.tun
          : tun // ignore: cast_nullable_to_non_nullable
              as Tun,
      interfaceName: freezed == interfaceName
          ? _value.interfaceName
          : interfaceName // ignore: cast_nullable_to_non_nullable
              as String?,
      dns: null == dns
          ? _value.dns
          : dns // ignore: cast_nullable_to_non_nullable
              as Dns,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ClashConfigImpl extends _ClashConfig {
  const _$ClashConfigImpl(
      {this.ipv6 = false,
      @JsonKey(name: 'mode') this.mode = Mode.rule,
      @JsonKey(name: "mixed-port") this.mixedPort = 17890,
      @JsonKey(name: "port") this.port = 17891,
      @JsonKey(name: "socks-port") this.socksPort = 17892,
      @JsonKey(name: 'redir-port') this.redirPort = 0,
      @JsonKey(name: 'tproxy-port') this.tproxyPort = 0,
      @JsonKey(name: 'allow-lan') this.allowLan = false,
      @JsonKey(name: 'log-level') this.logLevel = LogLevel.info,
      @JsonKey(name: 'tun') this.tun = const Tun(enable: false),
      @JsonKey(name: 'interface-name') this.interfaceName,
      @JsonKey(name: 'dns') this.dns = const Dns()})
      : super._();

  factory _$ClashConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClashConfigImplFromJson(json);

  @override
  @JsonKey()
  final bool ipv6;
  @override
  @JsonKey(name: 'mode')
  final Mode mode;
  @override
  @JsonKey(name: "mixed-port")
  final int mixedPort;
  @override
  @JsonKey(name: "port")
  final int port;
  @override
  @JsonKey(name: "socks-port")
  final int socksPort;
  @override
  @JsonKey(name: 'redir-port')
  final int redirPort;
  @override
  @JsonKey(name: 'tproxy-port')
  final int tproxyPort;
  @override
  @JsonKey(name: 'allow-lan')
  final bool allowLan;
  @override
  @JsonKey(name: 'log-level')
  final LogLevel logLevel;
  @override
  @JsonKey(name: 'tun')
  final Tun tun;
  @override
  @JsonKey(name: 'interface-name')
  final String? interfaceName;
  @override
  @JsonKey(name: 'dns')
  final Dns dns;

  @override
  String toString() {
    return 'ClashConfig(ipv6: $ipv6, mode: $mode, mixedPort: $mixedPort, port: $port, socksPort: $socksPort, redirPort: $redirPort, tproxyPort: $tproxyPort, allowLan: $allowLan, logLevel: $logLevel, tun: $tun, interfaceName: $interfaceName, dns: $dns)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClashConfigImpl &&
            (identical(other.ipv6, ipv6) || other.ipv6 == ipv6) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.mixedPort, mixedPort) ||
                other.mixedPort == mixedPort) &&
            (identical(other.port, port) || other.port == port) &&
            (identical(other.socksPort, socksPort) ||
                other.socksPort == socksPort) &&
            (identical(other.redirPort, redirPort) ||
                other.redirPort == redirPort) &&
            (identical(other.tproxyPort, tproxyPort) ||
                other.tproxyPort == tproxyPort) &&
            (identical(other.allowLan, allowLan) ||
                other.allowLan == allowLan) &&
            (identical(other.logLevel, logLevel) ||
                other.logLevel == logLevel) &&
            (identical(other.tun, tun) || other.tun == tun) &&
            (identical(other.interfaceName, interfaceName) ||
                other.interfaceName == interfaceName) &&
            (identical(other.dns, dns) || other.dns == dns));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      ipv6,
      mode,
      mixedPort,
      port,
      socksPort,
      redirPort,
      tproxyPort,
      allowLan,
      logLevel,
      tun,
      interfaceName,
      dns);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClashConfigImplCopyWith<_$ClashConfigImpl> get copyWith =>
      __$$ClashConfigImplCopyWithImpl<_$ClashConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClashConfigImplToJson(
      this,
    );
  }
}

abstract class _ClashConfig extends ClashConfig {
  const factory _ClashConfig(
      {final bool ipv6,
      @JsonKey(name: 'mode') final Mode mode,
      @JsonKey(name: "mixed-port") final int mixedPort,
      @JsonKey(name: "port") final int port,
      @JsonKey(name: "socks-port") final int socksPort,
      @JsonKey(name: 'redir-port') final int redirPort,
      @JsonKey(name: 'tproxy-port') final int tproxyPort,
      @JsonKey(name: 'allow-lan') final bool allowLan,
      @JsonKey(name: 'log-level') final LogLevel logLevel,
      @JsonKey(name: 'tun') final Tun tun,
      @JsonKey(name: 'interface-name') final String? interfaceName,
      @JsonKey(name: 'dns') final Dns dns}) = _$ClashConfigImpl;
  const _ClashConfig._() : super._();

  factory _ClashConfig.fromJson(Map<String, dynamic> json) =
      _$ClashConfigImpl.fromJson;

  @override
  bool get ipv6;
  @override
  @JsonKey(name: 'mode')
  Mode get mode;
  @override
  @JsonKey(name: "mixed-port")
  int get mixedPort;
  @override
  @JsonKey(name: "port")
  int get port;
  @override
  @JsonKey(name: "socks-port")
  int get socksPort;
  @override
  @JsonKey(name: 'redir-port')
  int get redirPort;
  @override
  @JsonKey(name: 'tproxy-port')
  int get tproxyPort;
  @override
  @JsonKey(name: 'allow-lan')
  bool get allowLan;
  @override
  @JsonKey(name: 'log-level')
  LogLevel get logLevel;
  @override
  @JsonKey(name: 'tun')
  Tun get tun;
  @override
  @JsonKey(name: 'interface-name')
  String? get interfaceName;
  @override
  @JsonKey(name: 'dns')
  Dns get dns;
  @override
  @JsonKey(ignore: true)
  _$$ClashConfigImplCopyWith<_$ClashConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Tun _$TunFromJson(Map<String, dynamic> json) {
  return _Tun.fromJson(json);
}

/// @nodoc
mixin _$Tun {
  @JsonKey(name: 'enable')
  bool get enable => throw _privateConstructorUsedError;
  @JsonKey(name: 'stack')
  TunStack get stack => throw _privateConstructorUsedError;
  @JsonKey(name: 'auto-route')
  bool get autoRoute => throw _privateConstructorUsedError;
  @JsonKey(name: 'auto-detect-interface')
  bool get autoDetectInterface => throw _privateConstructorUsedError;
  @JsonKey(name: 'device')
  String? get device => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TunCopyWith<Tun> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TunCopyWith<$Res> {
  factory $TunCopyWith(Tun value, $Res Function(Tun) then) =
      _$TunCopyWithImpl<$Res, Tun>;
  @useResult
  $Res call(
      {@JsonKey(name: 'enable') bool enable,
      @JsonKey(name: 'stack') TunStack stack,
      @JsonKey(name: 'auto-route') bool autoRoute,
      @JsonKey(name: 'auto-detect-interface') bool autoDetectInterface,
      @JsonKey(name: 'device') String? device});
}

/// @nodoc
class _$TunCopyWithImpl<$Res, $Val extends Tun> implements $TunCopyWith<$Res> {
  _$TunCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enable = null,
    Object? stack = null,
    Object? autoRoute = null,
    Object? autoDetectInterface = null,
    Object? device = freezed,
  }) {
    return _then(_value.copyWith(
      enable: null == enable
          ? _value.enable
          : enable // ignore: cast_nullable_to_non_nullable
              as bool,
      stack: null == stack
          ? _value.stack
          : stack // ignore: cast_nullable_to_non_nullable
              as TunStack,
      autoRoute: null == autoRoute
          ? _value.autoRoute
          : autoRoute // ignore: cast_nullable_to_non_nullable
              as bool,
      autoDetectInterface: null == autoDetectInterface
          ? _value.autoDetectInterface
          : autoDetectInterface // ignore: cast_nullable_to_non_nullable
              as bool,
      device: freezed == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TunImplCopyWith<$Res> implements $TunCopyWith<$Res> {
  factory _$$TunImplCopyWith(_$TunImpl value, $Res Function(_$TunImpl) then) =
      __$$TunImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'enable') bool enable,
      @JsonKey(name: 'stack') TunStack stack,
      @JsonKey(name: 'auto-route') bool autoRoute,
      @JsonKey(name: 'auto-detect-interface') bool autoDetectInterface,
      @JsonKey(name: 'device') String? device});
}

/// @nodoc
class __$$TunImplCopyWithImpl<$Res> extends _$TunCopyWithImpl<$Res, _$TunImpl>
    implements _$$TunImplCopyWith<$Res> {
  __$$TunImplCopyWithImpl(_$TunImpl _value, $Res Function(_$TunImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enable = null,
    Object? stack = null,
    Object? autoRoute = null,
    Object? autoDetectInterface = null,
    Object? device = freezed,
  }) {
    return _then(_$TunImpl(
      enable: null == enable
          ? _value.enable
          : enable // ignore: cast_nullable_to_non_nullable
              as bool,
      stack: null == stack
          ? _value.stack
          : stack // ignore: cast_nullable_to_non_nullable
              as TunStack,
      autoRoute: null == autoRoute
          ? _value.autoRoute
          : autoRoute // ignore: cast_nullable_to_non_nullable
              as bool,
      autoDetectInterface: null == autoDetectInterface
          ? _value.autoDetectInterface
          : autoDetectInterface // ignore: cast_nullable_to_non_nullable
              as bool,
      device: freezed == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TunImpl extends _Tun {
  const _$TunImpl(
      {@JsonKey(name: 'enable') this.enable = false,
      @JsonKey(name: 'stack') this.stack = TunStack.mixed,
      @JsonKey(name: 'auto-route') this.autoRoute = true,
      @JsonKey(name: 'auto-detect-interface') this.autoDetectInterface = true,
      @JsonKey(name: 'device') this.device})
      : super._();

  factory _$TunImpl.fromJson(Map<String, dynamic> json) =>
      _$$TunImplFromJson(json);

  @override
  @JsonKey(name: 'enable')
  final bool enable;
  @override
  @JsonKey(name: 'stack')
  final TunStack stack;
  @override
  @JsonKey(name: 'auto-route')
  final bool autoRoute;
  @override
  @JsonKey(name: 'auto-detect-interface')
  final bool autoDetectInterface;
  @override
  @JsonKey(name: 'device')
  final String? device;

  @override
  String toString() {
    return 'Tun(enable: $enable, stack: $stack, autoRoute: $autoRoute, autoDetectInterface: $autoDetectInterface, device: $device)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TunImpl &&
            (identical(other.enable, enable) || other.enable == enable) &&
            (identical(other.stack, stack) || other.stack == stack) &&
            (identical(other.autoRoute, autoRoute) ||
                other.autoRoute == autoRoute) &&
            (identical(other.autoDetectInterface, autoDetectInterface) ||
                other.autoDetectInterface == autoDetectInterface) &&
            (identical(other.device, device) || other.device == device));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, enable, stack, autoRoute, autoDetectInterface, device);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TunImplCopyWith<_$TunImpl> get copyWith =>
      __$$TunImplCopyWithImpl<_$TunImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TunImplToJson(
      this,
    );
  }
}

abstract class _Tun extends Tun {
  const factory _Tun(
      {@JsonKey(name: 'enable') final bool enable,
      @JsonKey(name: 'stack') final TunStack stack,
      @JsonKey(name: 'auto-route') final bool autoRoute,
      @JsonKey(name: 'auto-detect-interface') final bool autoDetectInterface,
      @JsonKey(name: 'device') final String? device}) = _$TunImpl;
  const _Tun._() : super._();

  factory _Tun.fromJson(Map<String, dynamic> json) = _$TunImpl.fromJson;

  @override
  @JsonKey(name: 'enable')
  bool get enable;
  @override
  @JsonKey(name: 'stack')
  TunStack get stack;
  @override
  @JsonKey(name: 'auto-route')
  bool get autoRoute;
  @override
  @JsonKey(name: 'auto-detect-interface')
  bool get autoDetectInterface;
  @override
  @JsonKey(name: 'device')
  String? get device;
  @override
  @JsonKey(ignore: true)
  _$$TunImplCopyWith<_$TunImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Dns _$DnsFromJson(Map<String, dynamic> json) {
  return _Dns.fromJson(json);
}

/// @nodoc
mixin _$Dns {
  @JsonKey(name: 'enable')
  bool get enable => throw _privateConstructorUsedError;
  @JsonKey(name: 'ipv6')
  bool get ipv6 => throw _privateConstructorUsedError;
  @JsonKey(name: 'enhanced-mode')
  String get enhancedMode => throw _privateConstructorUsedError;
  @JsonKey(name: 'default-nameserver')
  List<String> get defaultNameserver => throw _privateConstructorUsedError;
  @JsonKey(name: 'name-server')
  List<String> get nameServer => throw _privateConstructorUsedError;
  @JsonKey(name: 'fallback')
  List<String> get fallback => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DnsCopyWith<Dns> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DnsCopyWith<$Res> {
  factory $DnsCopyWith(Dns value, $Res Function(Dns) then) =
      _$DnsCopyWithImpl<$Res, Dns>;
  @useResult
  $Res call(
      {@JsonKey(name: 'enable') bool enable,
      @JsonKey(name: 'ipv6') bool ipv6,
      @JsonKey(name: 'enhanced-mode') String enhancedMode,
      @JsonKey(name: 'default-nameserver') List<String> defaultNameserver,
      @JsonKey(name: 'name-server') List<String> nameServer,
      @JsonKey(name: 'fallback') List<String> fallback});
}

/// @nodoc
class _$DnsCopyWithImpl<$Res, $Val extends Dns> implements $DnsCopyWith<$Res> {
  _$DnsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enable = null,
    Object? ipv6 = null,
    Object? enhancedMode = null,
    Object? defaultNameserver = null,
    Object? nameServer = null,
    Object? fallback = null,
  }) {
    return _then(_value.copyWith(
      enable: null == enable
          ? _value.enable
          : enable // ignore: cast_nullable_to_non_nullable
              as bool,
      ipv6: null == ipv6
          ? _value.ipv6
          : ipv6 // ignore: cast_nullable_to_non_nullable
              as bool,
      enhancedMode: null == enhancedMode
          ? _value.enhancedMode
          : enhancedMode // ignore: cast_nullable_to_non_nullable
              as String,
      defaultNameserver: null == defaultNameserver
          ? _value.defaultNameserver
          : defaultNameserver // ignore: cast_nullable_to_non_nullable
              as List<String>,
      nameServer: null == nameServer
          ? _value.nameServer
          : nameServer // ignore: cast_nullable_to_non_nullable
              as List<String>,
      fallback: null == fallback
          ? _value.fallback
          : fallback // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DnsImplCopyWith<$Res> implements $DnsCopyWith<$Res> {
  factory _$$DnsImplCopyWith(_$DnsImpl value, $Res Function(_$DnsImpl) then) =
      __$$DnsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'enable') bool enable,
      @JsonKey(name: 'ipv6') bool ipv6,
      @JsonKey(name: 'enhanced-mode') String enhancedMode,
      @JsonKey(name: 'default-nameserver') List<String> defaultNameserver,
      @JsonKey(name: 'name-server') List<String> nameServer,
      @JsonKey(name: 'fallback') List<String> fallback});
}

/// @nodoc
class __$$DnsImplCopyWithImpl<$Res> extends _$DnsCopyWithImpl<$Res, _$DnsImpl>
    implements _$$DnsImplCopyWith<$Res> {
  __$$DnsImplCopyWithImpl(_$DnsImpl _value, $Res Function(_$DnsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enable = null,
    Object? ipv6 = null,
    Object? enhancedMode = null,
    Object? defaultNameserver = null,
    Object? nameServer = null,
    Object? fallback = null,
  }) {
    return _then(_$DnsImpl(
      enable: null == enable
          ? _value.enable
          : enable // ignore: cast_nullable_to_non_nullable
              as bool,
      ipv6: null == ipv6
          ? _value.ipv6
          : ipv6 // ignore: cast_nullable_to_non_nullable
              as bool,
      enhancedMode: null == enhancedMode
          ? _value.enhancedMode
          : enhancedMode // ignore: cast_nullable_to_non_nullable
              as String,
      defaultNameserver: null == defaultNameserver
          ? _value._defaultNameserver
          : defaultNameserver // ignore: cast_nullable_to_non_nullable
              as List<String>,
      nameServer: null == nameServer
          ? _value._nameServer
          : nameServer // ignore: cast_nullable_to_non_nullable
              as List<String>,
      fallback: null == fallback
          ? _value._fallback
          : fallback // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DnsImpl extends _Dns {
  const _$DnsImpl(
      {@JsonKey(name: 'enable') this.enable = true,
      @JsonKey(name: 'ipv6') this.ipv6 = true,
      @JsonKey(name: 'enhanced-mode') this.enhancedMode = "fake-ip",
      @JsonKey(name: 'default-nameserver')
      final List<String> defaultNameserver = const [
        "223.5.5.5",
        "119.29.29.29"
      ],
      @JsonKey(name: 'name-server') final List<String> nameServer = const [
        "https://223.6.6.6/dns-query",
        "tls://dot.pub",
        "https://dns.alidns.com/dns-query",
        "223.5.5.5",
        "119.29.29.29"
      ],
      @JsonKey(name: 'fallback') final List<String> fallback = const [
        "https://1.0.0.1/dns-query",
        "tls://dns.google",
        "223.5.5.5",
        "119.29.29.29"
      ]})
      : _defaultNameserver = defaultNameserver,
        _nameServer = nameServer,
        _fallback = fallback,
        super._();

  factory _$DnsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DnsImplFromJson(json);

  @override
  @JsonKey(name: 'enable')
  final bool enable;
  @override
  @JsonKey(name: 'ipv6')
  final bool ipv6;
  @override
  @JsonKey(name: 'enhanced-mode')
  final String enhancedMode;
  final List<String> _defaultNameserver;
  @override
  @JsonKey(name: 'default-nameserver')
  List<String> get defaultNameserver {
    if (_defaultNameserver is EqualUnmodifiableListView)
      return _defaultNameserver;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_defaultNameserver);
  }

  final List<String> _nameServer;
  @override
  @JsonKey(name: 'name-server')
  List<String> get nameServer {
    if (_nameServer is EqualUnmodifiableListView) return _nameServer;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nameServer);
  }

  final List<String> _fallback;
  @override
  @JsonKey(name: 'fallback')
  List<String> get fallback {
    if (_fallback is EqualUnmodifiableListView) return _fallback;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fallback);
  }

  @override
  String toString() {
    return 'Dns(enable: $enable, ipv6: $ipv6, enhancedMode: $enhancedMode, defaultNameserver: $defaultNameserver, nameServer: $nameServer, fallback: $fallback)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DnsImpl &&
            (identical(other.enable, enable) || other.enable == enable) &&
            (identical(other.ipv6, ipv6) || other.ipv6 == ipv6) &&
            (identical(other.enhancedMode, enhancedMode) ||
                other.enhancedMode == enhancedMode) &&
            const DeepCollectionEquality()
                .equals(other._defaultNameserver, _defaultNameserver) &&
            const DeepCollectionEquality()
                .equals(other._nameServer, _nameServer) &&
            const DeepCollectionEquality().equals(other._fallback, _fallback));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      enable,
      ipv6,
      enhancedMode,
      const DeepCollectionEquality().hash(_defaultNameserver),
      const DeepCollectionEquality().hash(_nameServer),
      const DeepCollectionEquality().hash(_fallback));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DnsImplCopyWith<_$DnsImpl> get copyWith =>
      __$$DnsImplCopyWithImpl<_$DnsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DnsImplToJson(
      this,
    );
  }
}

abstract class _Dns extends Dns {
  const factory _Dns(
      {@JsonKey(name: 'enable') final bool enable,
      @JsonKey(name: 'ipv6') final bool ipv6,
      @JsonKey(name: 'enhanced-mode') final String enhancedMode,
      @JsonKey(name: 'default-nameserver') final List<String> defaultNameserver,
      @JsonKey(name: 'name-server') final List<String> nameServer,
      @JsonKey(name: 'fallback') final List<String> fallback}) = _$DnsImpl;
  const _Dns._() : super._();

  factory _Dns.fromJson(Map<String, dynamic> json) = _$DnsImpl.fromJson;

  @override
  @JsonKey(name: 'enable')
  bool get enable;
  @override
  @JsonKey(name: 'ipv6')
  bool get ipv6;
  @override
  @JsonKey(name: 'enhanced-mode')
  String get enhancedMode;
  @override
  @JsonKey(name: 'default-nameserver')
  List<String> get defaultNameserver;
  @override
  @JsonKey(name: 'name-server')
  List<String> get nameServer;
  @override
  @JsonKey(name: 'fallback')
  List<String> get fallback;
  @override
  @JsonKey(ignore: true)
  _$$DnsImplCopyWith<_$DnsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
