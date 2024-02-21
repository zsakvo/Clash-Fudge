import 'dart:ui';

import 'package:clash_fudge/hooks/window_listener.dart';
import 'package:clash_fudge/ui/activity/activity_provider.dart';
import 'package:clash_fudge/ui/home/macos/home_screen.dart';
import 'package:clash_fudge/ui/home/yaru/home_screen.dart' as Yaru;
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
import 'package:yaru/yaru.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

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
    WindowOptions windowOptions = const WindowOptions(
      size: Size(1070, 670),
      minimumSize: Size(1070, 670),
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.hidden,
      backgroundColor: Color.fromRGBO(0, 0, 0, 0),
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }
  final container = ProviderContainer();
  runApp(UncontrolledProviderScope(container: container, child: const YaruFc()));
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

class YaruFc extends HookConsumerWidget {
  const YaruFc({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return YaruTheme(
      data: const YaruThemeData(
        variant: YaruVariant.blue,
      ),
      builder: (context, yaru, child) {
        return MaterialApp(
          title: 'Clash-Fudge',
          debugShowCheckedModeBanner: true,
          theme: yaru.theme,
          darkTheme: yaru.darkTheme,
          highContrastTheme: yaruHighContrastLight,
          highContrastDarkTheme: yaruHighContrastDark,
          home: const Yaru.HomeScreen(),
          scrollBehavior: const MaterialScrollBehavior().copyWith(
            dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.touch,
              PointerDeviceKind.stylus,
              PointerDeviceKind.unknown,
              PointerDeviceKind.trackpad,
            },
          ),
        );
      },
    );
  }
}
