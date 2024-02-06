import 'dart:io';

import 'package:yaml_edit/yaml_edit.dart';

class ClashFudgeProfile {
  String content;
  late YamlEditor yaml;
  ClashFudgeProfile({
    required this.content,
  }) {
    yaml = YamlEditor(content);
  }

  /// 尝试补足缺失的 DNS 配置
  /// 尝试解析 dns->enable 字段，如果不存在该键值或者不为 true，则直接使用应用内的配置逻辑
  fixDns({Object? value}) {
    bool needUpdate = false;
    try {
      final dnsValue = yaml.parseAt(["dns", "enable"]).value;
      needUpdate = dnsValue != true;
    } catch (_) {
      needUpdate = true;
    } finally {
      if (needUpdate) {
        yaml.update(
            ["dns"],
            value ??
                {
                  "enable": true,
                  "ipv6": true,
                  "enhanced-mode": "fake-ip",
                  "default-nameserver": ["223.5.5.5", "119.29.29.29"],
                  "name-server": ["https://223.6.6.6/dns-query", "tls://dot.pub", "https://dns.alidns.com/dns-query"],
                  "fallback": ["https://1.0.0.1/dns-query", "tls://dns.google"],
                  "dns-hijack": ["any:53"]
                });
      }
    }
  }

  updateValues(Map<String, dynamic> appConfigValues) {
    appConfigValues.forEach((key, value) {
      yaml.update([key], value);
    });
  }

  save(String path) {
    var dir = Directory(path);
    if (!dir.existsSync()) dir.createSync(recursive: true);
    File("$path/config.yaml").writeAsStringSync(yaml.toString());
  }
}
