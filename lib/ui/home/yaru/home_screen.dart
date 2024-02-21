import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class HomeScreen extends StatefulHookConsumerWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final List<PageItem> pageItems = [
    PageItem(
        titleString: "活动",
        page: Container(),
        leadingIcon: YaruIcons.screen,
        leadingIconSelected: YaruIcons.screen_filled),
    PageItem(
        titleString: "概览",
        page: Container(),
        leadingIcon: YaruIcons.meter_6,
        leadingIconSelected: YaruIcons.meter_0_filled),
    PageItem(
        titleString: "策略",
        page: Container(),
        leadingIcon: YaruIcons.chat_away,
        leadingIconSelected: YaruIcons.chat_away_filled),
    PageItem(
        titleString: "规则",
        page: Container(),
        leadingIcon: YaruIcons.mail_signed,
        leadingIconSelected: YaruIcons.mail_signed_filled),
    PageItem(
        titleString: "日志",
        page: Container(),
        leadingIcon: YaruIcons.task_list,
        leadingIconSelected: YaruIcons.task_list_filled),
    PageItem(
        titleString: "连接",
        page: Container(),
        leadingIcon: YaruIcons.network,
        leadingIconSelected: YaruIcons.network_filled),
    PageItem(
        titleString: "设置",
        page: Container(),
        leadingIcon: YaruIcons.settings,
        leadingIconSelected: YaruIcons.settings_filled),
  ];
  @override
  Widget build(BuildContext context) {
    return YaruMasterDetailPage(
      initialIndex: 1,
      length: pageItems.length,
      layoutDelegate: const YaruMasterResizablePaneDelegate(
        initialPaneWidth: 240,
        minPageWidth: 400,
        minPaneWidth: 200,
      ),
      tileBuilder: (context, index, selected, availableWidth) => index == 0
          ? Padding(
              padding: const EdgeInsets.only(top: 32),
              child: pageItems[index].yaruTitle(selected),
            )
          : pageItems[index].yaruTitle(selected),
      pageBuilder: (context, index) => YaruDetailPage(
        body: pageItems[index].page,
      ),
    );
  }
}

class PageItem {
  final String titleString;
  final Widget page;
  final IconData leadingIcon;
  final IconData? leadingIconSelected;
  PageItem({required this.titleString, required this.page, required this.leadingIcon, this.leadingIconSelected});

  Widget get title => Text(titleString);

  Icon get leading => Icon(leadingIcon);

  Icon get leadingSelected => Icon(leadingIconSelected ?? leadingIcon);

  Widget yaruTitle(bool selected) {
    return YaruMasterTile(
      leading: selected ? leadingSelected : leading,
      title: title,
    );
  }
}
