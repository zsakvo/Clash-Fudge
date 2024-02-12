import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'clash_profile_subscriber.dart';

part 'app_config.freezed.dart';
part 'app_config.g.dart';

@freezed
class AppConfig with _$AppConfig {
  @JsonSerializable(explicitToJson: true)
  const factory AppConfig({
    String? currentProfile,
    @Default([]) List<ClashProfileSubscriber> subscribers,
    @Default(false) bool isSysProxy,
    @Default(false) bool autoStart,
    @Default("http://connect.rom.miui.com/generate_204") String testUrl,
    @Default(5) int testTimeout,
    @Default(SysTrayShow.all) SysTrayShow sysTrayShow,
    @Default(SysTrayClick.menu) SysTrayClick sysTrayClick,
    // required String pofilePath,
    @Default(ClashConfig()) ClashConfig core,
  }) = _AppConfig;

  const AppConfig._();

  factory AppConfig.fromJson(Map<String, dynamic> json) => _$AppConfigFromJson(json);

  AppConfig setKV({
    required String key,
    required dynamic value,
  }) {
    final json = toJson();
    json[key] = value;
    return AppConfig.fromJson(toJson()..[key] = value);
  }
}

@freezed
class ClashConfig with _$ClashConfig {
  @JsonSerializable(explicitToJson: true)
  const factory ClashConfig({
    @Default(false) bool ipv6,
    @JsonKey(name: 'mode') @Default(Mode.rule) Mode mode,
    @JsonKey(name: "mixed-port") @Default(17890) int mixedPort,
    @JsonKey(name: "port") @Default(17891) int port,
    @JsonKey(name: "socks-port") @Default(17892) int socksPort,
    @JsonKey(name: 'redir-port') @Default(0) int redirPort,
    @JsonKey(name: 'tproxy-port') @Default(0) int tproxyPort,
    @JsonKey(name: 'allow-lan') @Default(false) bool allowLan,
    @JsonKey(name: 'log-level') @Default(LogLevel.info) LogLevel logLevel,
    @JsonKey(name: 'tun') @Default(Tun(enable: false)) Tun tun,
    @JsonKey(name: 'interface-name') String? interfaceName,
    @JsonKey(name: 'dns') @Default(Dns()) Dns dns,
  }) = _ClashConfig;

  const ClashConfig._();

  factory ClashConfig.fromJson(Map<String, dynamic> json) => _$ClashConfigFromJson(json);
}

@freezed
class Tun with _$Tun {
  const factory Tun(
      {@JsonKey(name: 'enable') @Default(false) bool enable,
      @JsonKey(name: 'stack') @Default(TunStack.mixed) TunStack stack,
      @JsonKey(name: 'auto-route') @Default(true) bool autoRoute,
      @JsonKey(name: 'auto-detect-interface') @Default(true) bool autoDetectInterface,
      @JsonKey(name: 'device') String? device}) = _Tun;

  const Tun._();

  factory Tun.fromJson(Map<String, dynamic> json) => _$TunFromJson(json);
}

@freezed
class Dns with _$Dns {
  const factory Dns({
    @JsonKey(name: 'enable') @Default(true) bool enable,
    @JsonKey(name: 'ipv6') @Default(true) bool ipv6,
    @JsonKey(name: 'listen') @Default("127.0.0.1:51153") String listen,
    @JsonKey(name: 'enhanced-mode') @Default("fake-ip") String enhancedMode,
    @JsonKey(name: 'default-nameserver') @Default(["223.5.5.5", "119.29.29.29"]) List<String> defaultNameserver,
    @JsonKey(name: 'name-server')
    @Default([
      "https://223.6.6.6/dns-query",
      "tls://dot.pub",
      "https://dns.alidns.com/dns-query",
      "223.5.5.5",
      "119.29.29.29"
    ])
    List<String> nameServer,
    @JsonKey(name: 'fallback')
    @Default(["https://1.0.0.1/dns-query", "tls://dns.google", "223.5.5.5", "119.29.29.29"])
    List<String> fallback,
  }) = _Dns;
  const Dns._();
  factory Dns.fromJson(Map<String, dynamic> json) => _$DnsFromJson(json);
}

enum Mode { direct, global, rule }

enum TunStack { system, gvisor, mixed }

enum LogLevel { debug, info, warning, error, silent }

enum SysTrayShow { all, speed, icon, none }

enum SysTrayClick { menu, window }

enum PresetColors {
  red(color: Colors.red),
  // pink(color: Colors.pink),
  // purple(color: Colors.purple),
  deepPurple(color: Colors.deepPurple),
  // indigo(color: Colors.indigo),
  blue(color: Colors.blue),
  // lightBlue(color: Colors.lightBlue),
  // cyan(color: Colors.cyan),
  teal(color: Colors.teal),
  // green(color: Colors.green),
  lightGreen(color: Colors.lightGreen),
  // lime(color: Colors.lime),
  yellow(color: Colors.yellow),
  // amber(color: Colors.amber),
  orange(color: Colors.orange),
  // deepOrange(color: Colors.deepOrange),
  brown(color: Colors.brown),
  // blueGrey(color: Colors.blueGrey),
  // grey(color: Colors.grey)
  ;

  final Color color;

  const PresetColors({
    required this.color,
  });
}
