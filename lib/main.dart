import 'dart:io';

import 'package:clash_fudge/hooks/window_listener.dart';
import 'package:clash_fudge/ui/activity/activity_provider.dart';
import 'package:clash_fudge/ui/home/home_screen.dart';
import 'package:clash_fudge/utils/constant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:local_notifier/local_notifier.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:path_provider/path_provider.dart';
import 'package:system_tray/system_tray.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  Const.appSupportPath = (await getApplicationSupportDirectory()).path;
  if (!kIsWeb) {
    await localNotifier.setup(
      appName: 'cc.zsakvo.clash-fudge',
    );
    Const.systemTray = SystemTray();
    await Const.systemTray.initSystemTray(iconPath: "assets/icon/systray.png", width: 24);
    WindowOptions windowOptions = WindowOptions(
      size: const Size(1070, 670),
      minimumSize: const Size(1070, 670),
      skipTaskbar: false,
      titleBarStyle: Platform.isMacOS ? TitleBarStyle.hidden : TitleBarStyle.normal,
      backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }
  final container = ProviderContainer();
  runApp(UncontrolledProviderScope(container: container, child: const FC()));
}

class FC extends HookConsumerWidget {
  const FC({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useWindowFocus(() {
      windowManager.isSkipTaskbar().then((value) => {
            if (value) {windowManager.setSkipTaskbar(false)}
          });
    });
    useWindowClose(() {
      ref.invalidate(chartProvider);
      ref.invalidate(snapshotProvider);
      windowManager.setSkipTaskbar(true);
    });
    return MacosApp(
      title: "Clash-Fudge",
      theme: MacosThemeData.light(),
      darkTheme: MacosThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MacosApp(
      title: "FClash",
      theme: MacosThemeData.light(),
      darkTheme: MacosThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}
