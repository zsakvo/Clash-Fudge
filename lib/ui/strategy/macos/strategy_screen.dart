import 'package:contextual_menu/contextual_menu.dart';
import 'package:clash_fudge/app_provider.dart';
import 'package:clash_fudge/components/buttons/segmented_control.dart';
import 'package:clash_fudge/components/tab_view/tab.dart';
import 'package:clash_fudge/models/app_config.dart';
import 'package:clash_fudge/ui/strategy/components/flow_card.dart';
import 'package:clash_fudge/ui/strategy/strategy_provider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:macos_ui/macos_ui.dart' hide MacosSegmentedControl, MacosTab, MacosPulldownMenuItem;

class StrategyScreen extends StatefulHookConsumerWidget {
  const StrategyScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StrategyScreenState();
}

class _StrategyScreenState extends ConsumerState<StrategyScreen> {
  final tabPadding = const EdgeInsets.symmetric(horizontal: 42, vertical: 4);
  @override
  Widget build(BuildContext context) {
    final typography = MacosTypography.of(context);
    final strategey = ref.watch(strategeyProvider);
    final currentMode = ref.watch(appConfigProvider.select((value) => value.value!.core.mode));
    final tabController = MacosTabController(initialIndex: Mode.values.indexOf(currentMode), length: 3);
    tabController.addListener(() {
      ref.read(appConfigProvider.notifier).changeMode(Mode.values[tabController.index]);
    });
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(top: 18, left: 24),
            child: Text(
              '策略',
              style: typography.largeTitle.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 24),
            child: MacosSegmentedControl(
              controller: tabController,
              tabs: [
                MacosTab(
                    label: '直接连接',
                    labelStyle: const TextStyle(fontSize: 12),
                    prefixIcon: SvgPicture.asset("assets/icon/signpost.svg",
                        width: 15, colorFilter: const ColorFilter.mode(Color(0xFF393939), BlendMode.srcIn)),
                    active: tabController.index == 0,
                    tabPadding: tabPadding),
                MacosTab(
                    label: '全局代理',
                    labelStyle: const TextStyle(fontSize: 12),
                    active: tabController.index == 1,
                    prefixIcon: SvgPicture.asset("assets/icon/git-merge.svg",
                        width: 15, colorFilter: const ColorFilter.mode(Color(0xFF393939), BlendMode.srcIn)),
                    tabPadding: tabPadding),
                MacosTab(
                    label: '规则判定',
                    labelStyle: const TextStyle(fontSize: 12),
                    active: tabController.index == 2,
                    prefixIcon: SvgPicture.asset("assets/icon/code.svg",
                        width: 15, colorFilter: const ColorFilter.mode(Color(0xFF393939), BlendMode.srcIn)),
                    tabPadding: tabPadding),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8, left: 24),
            child: Text(
              "根据规则系统判定处理方式。",
              style: TextStyle(
                color: Color(0xffb3b3b3),
                fontSize: 11,
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(
              top: 16,
            ),
            child: CustomScrollView(slivers: [
              const SliverToBoxAdapter(
                  child: Padding(
                padding: EdgeInsets.only(bottom: 12, top: 48, left: 24, right: 24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "代理",
                      style: TextStyle(color: Color(0xff9c27b0), fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                  ],
                ),
              )),
              SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  sliver: SliverGrid.extent(
                      maxCrossAxisExtent: 164,
                      childAspectRatio: 1.9,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 14,
                      children: strategey.$1
                          .map((e) => FlowCard(
                                headerLabel: e.type,
                                mainText: e.name,
                                footerLabel: e.delay != null ? "${e.delay}ms" : "点击测试",
                                footerColor: (label) {
                                  double? delay = double.tryParse(label.substring(0, label.length - 2));
                                  if (delay != null) {
                                    if (delay < 100) {
                                      return const Color(0xff4caf50);
                                    } else if (delay < 200) {
                                      return const Color(0xffff9800);
                                    } else {
                                      return const Color(0xffe53935);
                                    }
                                  } else {
                                    return const Color(0xffb4b5b7);
                                  }
                                },
                                onClick: () {
                                  ref.read(strategeyProvider.notifier).testProxy(e.name);
                                },
                              ))
                          .toList())),
              const SliverToBoxAdapter(
                  child: Padding(
                padding: EdgeInsets.only(bottom: 12, top: 48, left: 24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "策略",
                      style: TextStyle(color: Color(0xffff9800), fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )),
              SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  sliver: SliverGrid.extent(
                      maxCrossAxisExtent: 160,
                      childAspectRatio: 1.9,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 14,
                      children: strategey.$2
                          .map((e) => FlowCard(
                                headerLabel: e.type,
                                mainText: e.name,
                                footerLabel: e.now ?? "",
                                menuTriggerButton: kPrimaryMouseButton,
                                menu: Menu(
                                    items: e.all
                                        ?.map((item) => MenuItem.checkbox(
                                              label: item,
                                              checked: item == e.now,
                                              onClick: (_) {
                                                ref
                                                    .read(strategeyProvider.notifier)
                                                    .setProxy(groupName: e.name, name: item);
                                              },
                                            ))
                                        .toList()),
                              ))
                          .toList())),
            ]),
          ))
        ]));
  }
}
