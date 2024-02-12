import 'package:flutter/services.dart';

class AndroidCore {
  static const MethodChannel _channel = MethodChannel('cc.zsakvo/socks_to_vpn');
  static Future<dynamic> startVpn() {
    return _channel.invokeMethod('startVpn');
  }

  static Future<dynamic> stopVpn() {
    return _channel.invokeMethod('stopVpn');
  }

  static Future<bool?> startService() {
    return _channel.invokeMethod<bool>('startService');
  }

  static Future<bool?> setConfig(String configPath) {
    return _channel.invokeMethod<bool>('setConfig', {"config": configPath});
  }

  static Future<bool?> setHomeDir(String dirPath) {
    return _channel.invokeMethod<bool>('setHomeDir', {"dir": dirPath});
  }

  static Future<String?> startRust() {
    return _channel.invokeMethod<String>('startRust');
  }

  static Future<bool?> verifyMMDB(String path) {
    return _channel.invokeMethod<bool>('verifyMMDB', {"path": path});
  }
}
