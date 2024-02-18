// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppConfigImpl _$$AppConfigImplFromJson(Map<String, dynamic> json) =>
    _$AppConfigImpl(
      currentProfile: json['currentProfile'] as String?,
      subscribers: (json['subscribers'] as List<dynamic>?)
              ?.map((e) =>
                  ClashProfileSubscriber.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isSysProxy: json['isSysProxy'] as bool? ?? false,
      autoStart: json['autoStart'] as bool? ?? false,
      testUrl: json['testUrl'] as String? ??
          "http://connect.rom.miui.com/generate_204",
      testTimeout: json['testTimeout'] as int? ?? 5,
      sysTrayShow:
          $enumDecodeNullable(_$SysTrayShowEnumMap, json['sysTrayShow']) ??
              SysTrayShow.all,
      sysTrayClick:
          $enumDecodeNullable(_$SysTrayClickEnumMap, json['sysTrayClick']) ??
              SysTrayClick.menu,
      core: json['core'] == null
          ? const ClashConfig()
          : ClashConfig.fromJson(json['core'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AppConfigImplToJson(_$AppConfigImpl instance) =>
    <String, dynamic>{
      'currentProfile': instance.currentProfile,
      'subscribers': instance.subscribers.map((e) => e.toJson()).toList(),
      'isSysProxy': instance.isSysProxy,
      'autoStart': instance.autoStart,
      'testUrl': instance.testUrl,
      'testTimeout': instance.testTimeout,
      'sysTrayShow': _$SysTrayShowEnumMap[instance.sysTrayShow]!,
      'sysTrayClick': _$SysTrayClickEnumMap[instance.sysTrayClick]!,
      'core': instance.core.toJson(),
    };

const _$SysTrayShowEnumMap = {
  SysTrayShow.all: 'all',
  SysTrayShow.speed: 'speed',
  SysTrayShow.icon: 'icon',
  SysTrayShow.none: 'none',
};

const _$SysTrayClickEnumMap = {
  SysTrayClick.menu: 'menu',
  SysTrayClick.window: 'window',
};

_$ClashConfigImpl _$$ClashConfigImplFromJson(Map<String, dynamic> json) =>
    _$ClashConfigImpl(
      ipv6: json['ipv6'] as bool? ?? false,
      mode: $enumDecodeNullable(_$ModeEnumMap, json['mode']) ?? Mode.rule,
      mixedPort: json['mixed-port'] as int? ?? 17890,
      port: json['port'] as int? ?? 17891,
      socksPort: json['socks-port'] as int? ?? 17892,
      redirPort: json['redir-port'] as int? ?? 0,
      tproxyPort: json['tproxy-port'] as int? ?? 0,
      allowLan: json['allow-lan'] as bool? ?? false,
      logLevel: $enumDecodeNullable(_$LogLevelEnumMap, json['log-level']) ??
          LogLevel.info,
      tun: json['tun'] == null
          ? const Tun(enable: false)
          : Tun.fromJson(json['tun'] as Map<String, dynamic>),
      interfaceName: json['interface-name'] as String?,
      dns: json['dns'] == null
          ? const Dns()
          : Dns.fromJson(json['dns'] as Map<String, dynamic>),
      keepAliveInterval: json['keep-alive-interval'] as int? ?? 30,
      unifiedDelay: json['unified-delay'] as bool? ?? false,
      profile: json['profile'] == null
          ? const Profile()
          : Profile.fromJson(json['profile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ClashConfigImplToJson(_$ClashConfigImpl instance) =>
    <String, dynamic>{
      'ipv6': instance.ipv6,
      'mode': _$ModeEnumMap[instance.mode]!,
      'mixed-port': instance.mixedPort,
      'port': instance.port,
      'socks-port': instance.socksPort,
      'redir-port': instance.redirPort,
      'tproxy-port': instance.tproxyPort,
      'allow-lan': instance.allowLan,
      'log-level': _$LogLevelEnumMap[instance.logLevel]!,
      'tun': instance.tun.toJson(),
      'interface-name': instance.interfaceName,
      'dns': instance.dns.toJson(),
      'keep-alive-interval': instance.keepAliveInterval,
      'unified-delay': instance.unifiedDelay,
      'profile': instance.profile?.toJson(),
    };

const _$ModeEnumMap = {
  Mode.direct: 'direct',
  Mode.global: 'global',
  Mode.rule: 'rule',
};

const _$LogLevelEnumMap = {
  LogLevel.debug: 'debug',
  LogLevel.info: 'info',
  LogLevel.warning: 'warning',
  LogLevel.error: 'error',
  LogLevel.silent: 'silent',
};

_$TunImpl _$$TunImplFromJson(Map<String, dynamic> json) => _$TunImpl(
      enable: json['enable'] as bool? ?? false,
      stack: $enumDecodeNullable(_$TunStackEnumMap, json['stack']) ??
          TunStack.mixed,
      autoRoute: json['auto-route'] as bool? ?? true,
      autoDetectInterface: json['auto-detect-interface'] as bool? ?? true,
      device: json['device'] as String?,
    );

Map<String, dynamic> _$$TunImplToJson(_$TunImpl instance) => <String, dynamic>{
      'enable': instance.enable,
      'stack': _$TunStackEnumMap[instance.stack]!,
      'auto-route': instance.autoRoute,
      'auto-detect-interface': instance.autoDetectInterface,
      'device': instance.device,
    };

const _$TunStackEnumMap = {
  TunStack.system: 'system',
  TunStack.gvisor: 'gvisor',
  TunStack.mixed: 'mixed',
};

_$DnsImpl _$$DnsImplFromJson(Map<String, dynamic> json) => _$DnsImpl(
      enable: json['enable'] as bool? ?? true,
      ipv6: json['ipv6'] as bool? ?? true,
      listen: json['listen'] as String?,
      enhancedMode: json['enhanced-mode'] as String? ?? "fake-ip",
      defaultNameserver: (json['default-nameserver'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const ["119.29.29.29", "8.8.8.8", "tls://223.5.5.5:853"],
      nameServer: (json['nameserver'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const ["tls://dot.pub", "https://dns.alidns.com/dns-query"],
      fallback: (json['fallback'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const ["https://1.0.0.1/dns-query", "tls://dns.google"],
      proxyServerNameServer: (json['proxy-server-nameserver'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const ['https://1.0.0.1/dns-query', 'tls://dot.pub'],
      fakeIpFilter: (json['fake-ip-filter'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [
            "localhost.ptlogin2.qq.com",
            '127.0.0.1',
            '192.168.0.0/16',
            '10.0.0.0/8',
            '172.16.0.0/12',
            '100.64.0.0/10',
            '17.0.0.0/8',
            'localhost',
            '*.local',
            'e.crashlytics.com',
            'captive.apple.com',
            '::ffff:0:0:0:0/1',
            '::ffff:128:0:0:0/1'
          ],
    );

Map<String, dynamic> _$$DnsImplToJson(_$DnsImpl instance) => <String, dynamic>{
      'enable': instance.enable,
      'ipv6': instance.ipv6,
      'listen': instance.listen,
      'enhanced-mode': instance.enhancedMode,
      'default-nameserver': instance.defaultNameserver,
      'nameserver': instance.nameServer,
      'fallback': instance.fallback,
      'proxy-server-nameserver': instance.proxyServerNameServer,
      'fake-ip-filter': instance.fakeIpFilter,
    };

_$ProfileImpl _$$ProfileImplFromJson(Map<String, dynamic> json) =>
    _$ProfileImpl(
      storeSelected: json['store-selected'] as bool?,
      storeFakeIp: json['store-fake-ip'] as bool?,
    );

Map<String, dynamic> _$$ProfileImplToJson(_$ProfileImpl instance) =>
    <String, dynamic>{
      'store-selected': instance.storeSelected,
      'store-fake-ip': instance.storeFakeIp,
    };
