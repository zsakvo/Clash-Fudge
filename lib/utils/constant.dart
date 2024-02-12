import 'dart:io';

import 'package:system_tray/system_tray.dart';

class Const {
  static final bool isDesktop = (Platform.isWindows || Platform.isMacOS || Platform.isLinux);

  static String coreName = 'ClashFudgeCore';

  static String geoIp = "geoip.metadb";

  static String localhost = "127.0.0.1";

  static late final int clashPort;

  // static late final String clashServerUrl;

  static late final String appSupportPath;

  static late SystemTray systemTray;

  static String kSystemTrayEventRightClick = "right-click";
  static String kSystemTrayEventClick = "click";

  static String get logPath {
    return "$appSupportPath/LOG";
  }

  static String get corePath {
    return "$appSupportPath/core/$coreName";
  }

  static String get launchPath {
    return "$appSupportPath/core/launch";
  }

  static String get configPath {
    return "$appSupportPath/config.yaml";
  }

  static String get clashServerUrl {
    return "$localhost:$clashPort";
  }

  static String get execMacOsCoreCommand {
    final parsedCorePath = corePath.replaceAll(" ", "\\ ");
    final parsedLogPath = logPath.replaceAll(" ", "\\ ");
    return '(chmod +sx $parsedCorePath || true)&&(pkill ${Const.coreName} || true)&& $parsedCorePath -ext-ctl ${Const.clashServerUrl} > $parsedLogPath 2>&1 &';
  }

  static String get execMacOsCoreCommandWithRoot {
    final parsedCorePath = Const.corePath.replaceAll(" ", "\\\\ ");
    final parsedLaunchPath = Const.launchPath.replaceAll(" ", "\\\\ ");
    final parsedLogPath = logPath.replaceAll(" ", "\\\\ ");
    final parsedConfigPath = configPath.replaceAll(" ", "\\\\ ");
    return 'do shell script "chown root:admin $parsedCorePath\nchmod +sx $parsedCorePath\nchmod +sx $parsedLaunchPath\npkill ${Const.coreName}\nsudo $parsedCorePath -f $parsedConfigPath  -ext-ctl ${Const.clashServerUrl}  > $parsedLogPath 2>&1 &" with administrator privileges with prompt "需要 ROOT 授权以使用此功能。"';
  }
}

bool kIsRoot = false;

bool kIsDesktop = Platform.isLinux || Platform.isMacOS || Platform.isWindows;
