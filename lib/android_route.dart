import 'package:clash_fudge/ui/config/android/components/palette_screen.dart';
import 'package:clash_fudge/ui/edit_sub/android/edit_sub_screen.dart';
import 'package:clash_fudge/ui/home/android/home_screen.dart';
import 'package:clash_fudge/ui/logs/android/logs_screen.dart';
import 'package:clash_fudge/ui/scan/android/scan_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter AndroidRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
    GoRoute(path: '/palette', builder: (context, state) => const PaletteScreen()),
    GoRoute(path: '/scan', builder: (context, state) => const ScanScreen()),
    GoRoute(
        path: '/edit_sub',
        builder: (context, state) {
          final url = (state.extra as Map<String, dynamic>)["url"];
          return EditSubScreen(
            url: url,
          );
        }),
    GoRoute(path: '/logs', builder: (context, state) => const LogsScreen()),
  ],
);
