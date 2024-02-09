import 'package:clash_fudge/app_provider.dart';
import 'package:clash_fudge/ui/home/home_screen.dart';
import 'package:clash_fudge/utils/constant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:system_tray/system_tray.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  if (!kIsWeb) {
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
  runApp(UncontrolledProviderScope(container: container, child: const FC()));
}

class FC extends HookConsumerWidget with WindowListener {
  const FC({super.key});

  @override
  void onWindowClose() {
    windowManager.setSkipTaskbar(true);
    super.onWindowClose();
  }

  @override
  void onWindowFocus() {
    windowManager.isSkipTaskbar().then((value) => {
          if (value) {windowManager.setSkipTaskbar(false)}
        });
    super.onWindowFocus();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      initCore(ref);
      windowManager.addListener(this);
      return null;
    }, []);
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
