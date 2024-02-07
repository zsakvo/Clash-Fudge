import 'package:clash_fudge/app_provider.dart';
import 'package:clash_fudge/components/welcome/load_err.dart';
import 'package:clash_fudge/components/welcome/loading_core.dart';
import 'package:clash_fudge/ui/home/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  if (!kIsWeb) {
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

class FC extends HookConsumerWidget {
  const FC({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(coreStartUpProvider);
    return MacosApp(
      title: "Clash-Fudge",
      theme: MacosThemeData.light(),
      darkTheme: MacosThemeData.dark(),
      home: status.when(
          data: (data) => data ? const HomeScreen() : const Text("启动失败"),
          error: (error, stackTrace) => LoadError(
                error: error,
                stackTrace: stackTrace,
              ),
          loading: () => const LoadingCore()),
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
