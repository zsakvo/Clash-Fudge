import 'dart:io';

import 'package:clipboard/clipboard.dart';
import 'package:clash_fudge/utils/constant.dart';

class SystemUtil {
  static copyTeminalCommand(int port, int socksPort) {
    String command = "";
    if (Platform.isMacOS || Platform.isLinux) {
      command = "export https_proxy=127.0.0.1:$port http_proxy=127.0.0.1:$port all_proxy=127.0.0.1:$socksPort";
    } else if (Platform.isWindows) {
      command = "set http_proxy=127.0.0.1:$port \n set https_proxy=127.0.0.1:$port";
    }
    FlutterClipboard.copy(command);
  }

  static createMacSudoer() {
    final whoami = Process.runSync("whoami", []).stdout.trim();
    final parsedLaunchPath = Const.launchPath.replaceAll(" ", "\\\\ ");
    final command = "echo '$whoami ALL=(root) NOPASSWD: $parsedLaunchPath' | sudo tee /etc/sudoers.d/clash-fudge";
    Process.runSync("/usr/bin/osascript",
        ["-e", "do shell script \"$command\" with administrator privileges with prompt \"需要授权以更新权限信息。\""]);
  }

  static clearMacSudoer() {
    const command = "sudo rm /etc/sudoers.d/clash-fudge";
    Process.runSync("/usr/bin/osascript",
        ["-e", "do shell script \"$command\" with administrator privileges with prompt \"需要授权以更新权限信息。\""]);
  }

  static testMacPort(int port) {
    final shell = 'lsof -i:$port';
    final res = Process.runSync('sh', ['-c', shell]);
    return res.stdout.toString().isNotEmpty;
  }
}
