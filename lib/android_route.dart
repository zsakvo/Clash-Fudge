import 'package:clash_fudge/ui/config/android/components/palette_screen.dart';
import 'package:clash_fudge/ui/home/android/home_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter AndroidRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
    GoRoute(path: '/palette', builder: (context, state) => const PaletteScreen()),
  ],
);
