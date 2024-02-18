// ignore_for_file: library_prefixes

import 'dart:io';

import 'package:clash_fudge/android_app_provider.dart';
import 'package:clash_fudge/android_route.dart';
import 'package:clash_fudge/ui/home/macos/home_screen.dart';
import 'package:clash_fudge/utils/constant.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:local_notifier/local_notifier.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:path_provider/path_provider.dart';
import 'package:system_tray/system_tray.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Const.appSupportPath = (await getApplicationSupportDirectory()).path;
  if (kIsDesktop) {
    await windowManager.ensureInitialized();
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
  } else {
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    // 设置上下顶栏
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: [SystemUiOverlay.top]);
    if (Platform.isAndroid || Platform.isIOS) {
      const systemUiOverlayStyle =
          SystemUiOverlayStyle(statusBarColor: Colors.transparent, systemNavigationBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
    if (Platform.isAndroid) {
      await FlutterDisplayMode.setHighRefreshRate();
      const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('ic_logo');
      const InitializationSettings initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
      );
      await flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
      );
    }
  }
  final container = ProviderContainer();
  final colorSeed = await container.read(appColorProvider.future);
  runApp(UncontrolledProviderScope(container: container, child: App(colorSeed: colorSeed)));
}

App({int? colorSeed}) {
  if (Platform.isMacOS) {
    return const FC();
  } else if (Platform.isAndroid) {
    return AFC(colorSeed: colorSeed);
  } else {
    return const FC();
  }
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

class AFC extends HookConsumerWidget {
  const AFC({super.key, this.colorSeed});
  final int? colorSeed;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorSeed = ref.watch(appColorProvider).value;
    return DynamicColorBuilder(builder: (lightDynamic, darkDynamic) {
      final lightCustom = colorSeed == null
          ? lightDynamic
          : ColorScheme.fromSeed(seedColor: Color(colorSeed), brightness: Brightness.light);
      final darkCustom = colorSeed == null
          ? darkDynamic
          : ColorScheme.fromSeed(seedColor: Color(colorSeed), brightness: Brightness.dark);
      return MaterialApp.router(
        title: "Clash-Fudge",
        theme: ThemeData(
          colorScheme: lightCustom,
          brightness: Brightness.light,
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorScheme: darkCustom,
          brightness: Brightness.dark,
          useMaterial3: true,
        ),
        routerConfig: AndroidRouter,
      );
    });
  }
}
