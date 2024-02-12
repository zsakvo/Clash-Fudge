import 'package:clash_fudge/app_provider.dart';
import 'package:clash_fudge/components/loading/loading.dart';
import 'package:clash_fudge/ui/activity/macos/activity_screen.dart';
import 'package:clash_fudge/ui/config/config_screen.dart';
import 'package:clash_fudge/ui/connections/connections_screen.dart';
import 'package:clash_fudge/ui/logs/logs_screen.dart';
import 'package:clash_fudge/ui/overview/overview_screen.dart';
import 'package:clash_fudge/ui/rules/rules_screen.dart';
import 'package:clash_fudge/ui/strategy/macos/strategy_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';

import '../platform_menus.dart';

class HomeScreen extends StatefulHookConsumerWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final currentNavIndex = useState(0);
    final coreLoaded = ref.watch(coreLoadedProvider);
    return Stack(
      children: [
        PlatformMenuBar(
          menus: menuBarItems(),
          child: MacosWindow(
              backgroundColor: const Color(0xffebebea),
              sidebar: Sidebar(
                  topOffset: 36,
                  decoration: const BoxDecoration(color: Color(0xffebebea)),
                  isResizable: false,
                  builder: (context, scrollController) {
                    return SidebarItems(
                      itemSize: SidebarItemSize.large,
                      selectedColor: const Color(0xffd8d8d8),
                      items: [
                        buildSideBarItem(icon: 'pulse', label: "活动"),
                        buildSideBarItem(icon: 'function', label: "概览"),
                        buildGroupLabel("Proxy"),
                        buildSideBarItem(icon: 'box', label: "策略"),
                        buildSideBarItem(icon: 'git-merge', label: "规则"),
                        buildGroupLabel("Core"),
                        buildSideBarItem(icon: 'terminal', label: "日志"),
                        buildSideBarItem(icon: 'computer', label: "连接"),
                        buildGroupLabel("App"),
                        buildSideBarItem(icon: 'settings', label: "设置"),
                        // buildSideBarItem(icon: 'more', label: "关于"),
                      ],
                      currentIndex: currentNavIndex.value,
                      onChanged: (value) {
                        if (![2, 5, 8].contains(value)) {
                          currentNavIndex.value = value;
                        }
                      },
                    );
                  },
                  minWidth: 200),
              child: Container(
                margin: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 8,
                      offset: const Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: [
                  const ActivityScreen(),
                  const OverviewScreen(),
                  null,
                  const StrategyScreen(),
                  const RulesScreen(),
                  null,
                  const LogsScreen(),
                  const ConnectionsScreen(),
                  null,
                  const ConfigScreen(),
                  const LogsScreen(),
                ][currentNavIndex.value],
              )),
        ),
        coreLoaded.when(
          data: (value) {
            return value ? const SizedBox.shrink() : const Text("启动失败");
          },
          loading: () {
            return const AppLoading();
          },
          error: (error, stackTrace) {
            return const SizedBox();
          },
        ),
      ],
    );
  }

  buildSideBarItem({required String label, required String icon}) {
    return SidebarItem(
        leading: SvgPicture.asset(
          "assets/icon/$icon.svg",
          width: 16,
          colorFilter: const ColorFilter.mode(Color(0xff414143), BlendMode.srcIn),
        ),
        label: Text(
          label,
          style: const TextStyle(fontSize: 13),
        ));
  }

  buildGroupLabel(String label) {
    return SidebarItem(
        label: Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        label,
        style: const TextStyle(fontSize: 12, color: Color(0xff7d7e7f)),
      ),
    ));
  }
}

enum CustSidebarItemSize {
  small(24.0, 12.0),
  medium(29.0, 16.0),
  large(36.0, 18.0),
  cust(40.0, 14.0);

  const CustSidebarItemSize(
    this.height,
    this.iconSize,
  );
  final double height;
  final double iconSize;
}
