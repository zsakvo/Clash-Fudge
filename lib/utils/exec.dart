import 'dart:io';
import 'dart:math';

import 'package:clash_fudge/request/http.dart';
import 'package:clash_fudge/utils/constant.dart';

import 'package:flutter/services.dart';

class ClashUtil {
  static Future<ProcessResult> _execMacOs() async {
    final parsedCorePath = Const.corePath.replaceAll(" ", "\\\\ ");
    final parsedLaunchPath = Const.launchPath.replaceAll(" ", "\\\\ ");
    final shRes = await Process.run("sudo", [Const.launchPath, Const.coreName, Const.clashPort.toString()]);
    if (shRes.stderr.toString().trim().isNotEmpty) {
      final shell =
          'chown root:admin $parsedCorePath\nchown root:admin $parsedLaunchPath\nchmod +sx $parsedCorePath\nchmod +sx $parsedLaunchPath\npkill ${Const.coreName}\n$parsedCorePath -ext-ctl ${Const.clashServerUrl}  > /dev/null 2>&1 &';
      final command = 'do shell script "$shell" with administrator privileges with prompt "需要授权以使用 TUN 等功能。"';
      return await Process.run(
        'osascript',
        ['-e', command],
      );
    } else {
      return shRes;
    }
  }

  // ignore: unused_element
  static Future<bool> _findCoreProcessMacOs() async {
    final shell = 'pgrep ${Const.coreName}';
    final res = await Process.run(
      'sh',
      ['-c', shell],
    );
    return res.stdout.toString().isNotEmpty;
  }

  static Future _killCoreProcessMacOs() async {
    final shell = 'pkill ${Const.coreName}';
    final command = 'do shell script "$shell" with administrator privileges with prompt "需要授权以使用 TUN 等功能。"';
    return await Process.run(
      'osascript',
      ['-e', command],
    );
  }

  static Future testPort() async {
    late bool portUsed;
    final int port = 10000 + Random().nextInt(30000);
    if (Platform.isMacOS) {
      final shell = 'lsof -i:$port';
      final res = await Process.run(
        'sh',
        ['-c', shell],
      );
      portUsed = res.stdout.toString().isNotEmpty;
    }
    if (portUsed) {
      return await testPort();
    } else {
      Const.clashPort = port;
    }
  }

  static Future killCoreProcess() async {
    if (Platform.isMacOS) {
      await _killCoreProcessMacOs();
    }
  }

  static Future<bool> initBinary() async {
    final coreFile = File(Const.corePath);
    final launchFile = File(Const.launchPath);
    if (!coreFile.existsSync()) {
      try {
        coreFile.createSync(recursive: true);
        launchFile.createSync(recursive: true);
        final binary = await rootBundle.load('assets/core/${Const.coreName}');
        await coreFile.writeAsBytes(binary.buffer.asUint8List());
        final launch = await rootBundle.load('assets/core/launch');
        await launchFile.writeAsBytes(launch.buffer.asUint8List());
        return true;
      } catch (e) {
        return false;
      }
    } else {
      return true;
    }
  }

  static Future<bool> execCore() async {
    await initBinary();
    await testPort();
    Http.init();
    if (Platform.isMacOS) {
      final scptErr = (await _execMacOs()).stderr.toString().trim();
      if (scptErr.isEmpty) {
        await Future.delayed(const Duration(milliseconds: 500));
        var current = DateTime.now().second;
        for (;;) {
          if (DateTime.now().second - current > 5) {
            return false;
          }
          final res = await Http.hello();
          if (res == 200) {
            return true;
          }
        }
      }
      return false;
    }
    return false;
  }
}
