import 'package:clash_fudge/ui/config/components/config_cell.dart';
import 'package:clash_fudge/ui/config/dialogs/general_config.dart';
import 'package:clash_fudge/ui/config/dialogs/profile_config.dart';
import 'package:clash_fudge/ui/config/dialogs/style_config.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:macos_ui/macos_ui.dart' hide PushButton;

import 'config_provider.dart';
import 'dialogs/libs_config.dart';

class ConfigScreen extends StatefulHookConsumerWidget {
  const ConfigScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ConfigScreenState();
}

class _ConfigScreenState extends ConsumerState<ConfigScreen> {
  @override
  Widget build(BuildContext context) {
    final typography = MacosTypography.of(context);
    final cellHeight = (MediaQuery.of(context).size.height - 72 * 2) * 1 / 3;
    final version = ref.watch(versionProvider);
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 18,
            ),
            child: Text(
              '设置',
              style: typography.largeTitle.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: cellHeight,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            decoration:
                BoxDecoration(border: Border(bottom: BorderSide(color: MacosColors.systemGrayColor.withOpacity(0.2)))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    child: ConfigCell(
                  icon: 'general_cell',
                  title: "通用",
                  subtitle: "在这里进行大部分的通用配置",
                  onTap: () {
                    showMacosSheet(
                        context: context,
                        barrierDismissible: false,
                        barrierColor: MacosColors.systemGrayColor.withOpacity(0.2),
                        builder: (_) {
                          return const GeneralConfig();
                        });
                  },
                )),
                Expanded(
                    child: ConfigCell(
                  icon: 'style_cell',
                  title: "外观",
                  subtitle: "菜单栏图标以及 Dock 相关的配置",
                  onTap: () {
                    showMacosSheet(
                        context: context,
                        barrierDismissible: false,
                        barrierColor: MacosColors.systemGrayColor.withOpacity(0.2),
                        builder: (_) {
                          return const StyleConfig();
                        });
                  },
                )),
                Expanded(
                    child: ConfigCell(
                  icon: 'profile_cell',
                  title: "配置",
                  subtitle: "内核的更多功能需要自行编辑配置文件",
                  onTap: () {
                    showMacosSheet(
                        context: context,
                        barrierDismissible: false,
                        barrierColor: MacosColors.systemGrayColor.withOpacity(0.2),
                        builder: (_) {
                          return const ProfileConfig();
                        });
                  },
                ))
              ],
            ),
          ),
          Container(
            height: cellHeight,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            decoration:
                BoxDecoration(border: Border(bottom: BorderSide(color: MacosColors.systemGrayColor.withOpacity(0.2)))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    child: ConfigCell(
                  icon: 'support_cell',
                  title: "开源",
                  subtitle: "本程序引入的开源支持库详情列表",
                  onTap: () {
                    showMacosSheet(
                        context: context,
                        barrierDismissible: false,
                        barrierColor: MacosColors.systemGrayColor.withOpacity(0.2),
                        builder: (_) {
                          return const LibsConfig();
                        });
                  },
                )),
              ],
            ),
          ),
          Expanded(
              child: Container(
                  padding: const EdgeInsets.only(left: 24, bottom: 24, top: 48),
                  alignment: Alignment.bottomLeft,
                  child: Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Clash-Fudge",
                          style: typography.title1,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 24),
                          child: Text(
                            "A Clash GUI based on Flutter.",
                            style: typography.body.copyWith(color: MacosColors.systemGrayColor.withOpacity(0.8)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12, bottom: 12),
                          child: Text(
                            "Current core version: ${version.value?['version'] ?? "--"}",
                            style: typography.body.copyWith(color: MacosColors.systemGrayColor.withOpacity(0.8)),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Image.asset('assets/imgs/logo.png')
                  ])) //  ),
              )
        ]));
  }
}
