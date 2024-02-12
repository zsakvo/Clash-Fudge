import 'package:clash_fudge/ui/home/android/home_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter AndroidRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
  ],
);
