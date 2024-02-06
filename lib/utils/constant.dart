import 'dart:io';

import 'package:system_tray/system_tray.dart';

class Const {
  static final bool isDesktop = (Platform.isWindows || Platform.isMacOS || Platform.isLinux);

  static String coreName = 'ClashFudgeCore';

  static String localhost = "127.0.0.1";

  static late final int clashPort;

  // static late final String clashServerUrl;

  static late final String appSupportPath;

  static late SystemTray systemTray;

  static String kSystemTrayEventRightClick = "right-click";
  static String kSystemTrayEventClick = "click";

  static String get corePath {
    return "$appSupportPath/core/$coreName";
  }

  static String get launchPath {
    return "$appSupportPath/core/launch";
  }

  static String get configPath {
    return "$appSupportPath/config/config.yaml";
  }

  static String get clashServerUrl {
    return "$localhost:$clashPort";
  }
}
