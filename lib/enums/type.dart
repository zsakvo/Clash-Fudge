// ignore_for_file: constant_identifier_names

enum LogLevel { debug, info, warning, error, silent }

enum AppLogLevel { ERROR, WARNING, INFO, SUCCESS }

List<String> ClashSelectorType = [
  "Relay",
  "Selector",
  "Fallback",
  "Url-test",
  "Load-balance",
];

List<String> ClashProxyType = [
  "Shadowsocks",
  "ShadowsocksR",
  "Snell",
  "Socks5",
  "Http",
  "Vmess",
  "Vless",
  "Trojan",
  "Hysteria",
  "Hysteria2",
  "WireGuard",
  "Tuic",
  "Direct",
  "Reject"
];
