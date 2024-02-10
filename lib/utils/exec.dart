import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:clash_fudge/utils/constant.dart';
import 'package:clash_fudge/utils/log.dart';

import 'package:flutter/services.dart';

class ClashUtil {
  static Future<ProcessResult> _execMacOs() async {
    // 优先尝试 sudo 启动，如果失败，则调用 osascript 启动
    final shRes =
        await Process.run("sudo", [Const.launchPath, Const.coreName, Const.clashPort.toString(), Const.logPath]);
    if (shRes.stderr.toString().trim().isNotEmpty) {
      kIsRoot = false;
      Log.e(Const.execMacOsCoreCommand);
      return await Process.run(
        'sh',
        ['-c', Const.execMacOsCoreCommand],
      );
    } else {
      kIsRoot = true;
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
    if (Platform.isMacOS || Platform.isLinux) {
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
      try {
        Const.clashPort = port;
      } catch (_) {}
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

  static Future initGeoIp() async {
    final mihomoDir = "${Platform.environment['HOME']}/.config/mihomo";
    final geoipFile = File("$mihomoDir/geoip.metadb");
    if (!geoipFile.existsSync()) {
      geoipFile.createSync(recursive: true);
      final file = await rootBundle.load('assets/core/${Const.geoIp}');
      await geoipFile.writeAsBytes(file.buffer.asUint8List());
    }
  }

  static Future<void> execCore() async {
    final logFile = File(Const.logPath);
    if (logFile.existsSync()) logFile.deleteSync();
    logFile.createSync(recursive: true);
    await initGeoIp();
    await initBinary();
    await testPort();
    _execMacOs().then((value) {
      final errText = value.stderr.toString().trim();
      if (errText.isNotEmpty) {
        logFile.readAsString().then((value) {
          logFile.writeAsString("$value\n\nexec kernel err:$errText");
        });
      }
    });
  }
}
