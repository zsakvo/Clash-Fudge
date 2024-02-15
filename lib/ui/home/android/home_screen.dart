import 'package:clash_fudge/android_app_provider.dart';
import 'package:clash_fudge/providers/strategy_provider.dart';
import 'package:clash_fudge/ui/activity/android/activity_screen.dart';
import 'package:clash_fudge/ui/config/android/config_screen.dart';
import 'package:clash_fudge/ui/profile/android/profile_screen.dart';
import 'package:clash_fudge/ui/strategy/android/strategy_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends StatefulHookConsumerWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final currentIndex = useState(0);
    final pageController = usePageController(initialPage: currentIndex.value);
    final strategey = ref.watch(strategeyProvider);
    final showStrategy = strategey.whenOrNull(
          data: (data) => data?.$2.isNotEmpty,
        ) ??
        false;
    ref.watch(androidAppConfigProvider);
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 60,
        titleSpacing: 16,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Image.asset(
            'assets/imgs/logo.png',
          ),
        ),
        title: const Text("Clash-Fudge"),
        backgroundColor: colorScheme.surfaceVariant.withOpacity(0.2),
        scrolledUnderElevation: 0,
        elevation: 0,
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (value) {
          currentIndex.value = value;
        },
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const ActivityScreen(),
          const ProfileScreen(),
          if (showStrategy) const StrategyScreen(),
          const ConfigScreen(),
        ],
      ),
      bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            height: 64,
            backgroundColor: colorScheme.surfaceVariant.withOpacity(0.2),
            surfaceTintColor: colorScheme.background,
            labelTextStyle: MaterialStateTextStyle.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return const TextStyle(fontWeight: FontWeight.bold, fontSize: 12);
              }
              return const TextStyle(fontWeight: FontWeight.normal, fontSize: 12);
            }),
          ),
          child: NavigationBar(
            selectedIndex: currentIndex.value,
            destinations: [
              buildNavigationDestination(icon: 'pulse', label: "活动", colorScheme: colorScheme),
              buildNavigationDestination(icon: 'box', label: "配置", colorScheme: colorScheme),
              if (showStrategy) buildNavigationDestination(icon: 'dribbble', label: "策略", colorScheme: colorScheme),
              buildNavigationDestination(icon: 'settings', label: "设置", colorScheme: colorScheme),
            ],
            onDestinationSelected: (value) {
              currentIndex.value = value;
              pageController.jumpToPage(
                value,
              );
            },
          )),
    );
  }

  buildNavigationDestination({required String icon, required String label, required ColorScheme colorScheme}) {
    return NavigationDestination(
      icon: SvgPicture.asset(
        'assets/icon/$icon.svg',
        colorFilter: ColorFilter.mode(colorScheme.onSurface, BlendMode.srcIn),
        width: 22,
      ),
      label: label,
    );
  }
}
