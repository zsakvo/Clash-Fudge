import 'package:clash_fudge/app_provider.dart';
import 'package:clash_fudge/components/dialog_sheet/dialog_sheet.dart';
import 'package:clash_fudge/ui/config/components/config_row.dart';
import 'package:clash_fudge/ui/config/dialogs/rename_profile.dart';
import 'package:clash_fudge/ui/config/dialogs/url_profile.dart';

import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';

import '../config_provider.dart';

class ProfileConfig extends StatefulHookConsumerWidget {
  const ProfileConfig({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileConfigState();
}

class _ProfileConfigState extends ConsumerState<ProfileConfig> {
  @override
  Widget build(BuildContext context) {
    final profilePath = ref.watch(profilePathProvider);
    final currentProfile = ref.watch(appConfigProvider.select((value) => value.value?.currentProfile));
    final typography = MacosTypography.of(context);
    final border = BorderSide(color: MacosColors.systemGrayColor.withOpacity(0.3));
    final subscribers = ref.watch(clashProfileSubscriberProvider);
    return DialogSheet(
      title: "配置",
      subtitle: "内核的更多功能需要自行编辑配置文件",
      width: 864,
      height: 600,
      child: Column(
        children: [
          ConfigRow(
              label: "配置存储路径",
              crossAxisAlignment: CrossAxisAlignment.start,
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    profilePath.valueOrNull ?? "",
                    style: typography.body,
                  ),
                  Text(
                    "Clash-Fudge 的绝大部分功能由配置文件控制，请指定一个目录用于存放配置文件",
                    style: typography.subheadline.copyWith(
                        color: MacosColors.systemGrayColor.withOpacity(
                          0.9,
                        ),
                        height: 2),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: PushButton(
                              onPressed: () {
                                ref.read(appConfigProvider.notifier).openProfileDir();
                              },
                              secondary: true,
                              controlSize: ControlSize.small,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 24),
                                child: Text(
                                  "在 Finder 中找到配置…",
                                  style: typography.body,
                                ),
                              )),
                        ),
                        PushButton(
                            onPressed: () {
                              ref.read(appConfigProvider.notifier).pickProfilePath();
                            },
                            secondary: true,
                            controlSize: ControlSize.small,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 24),
                              child: Text(
                                "修改配置存储路径…",
                                style: typography.body,
                              ),
                            ))
                      ],
                    ),
                  )
                ],
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Divider(
              color: MacosColors.systemGrayColor.withOpacity(0.2),
            ),
          ),
          Expanded(
              child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: MacosColors.systemGrayColor.withOpacity(0.3),
                      ),
                      borderRadius: BorderRadius.circular(6)),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 26,
                            width: 64,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(border: Border(bottom: border, right: border)),
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                              height: 26,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(border: Border(bottom: border, right: border)),
                              child: Text(
                                '名字',
                                style: typography.subheadline,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                              height: 26,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(border: Border(bottom: border, right: border)),
                              child: Text(
                                '类型',
                                style: typography.subheadline,
                              ),
                            ),
                          ),
                          Flexible(
                              flex: 4,
                              child: Container(
                                height: 26,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(border: Border(bottom: border, right: border)),
                                child: Text(
                                  '描述',
                                  style: typography.subheadline,
                                ),
                              )),
                        ],
                      ),
                      Expanded(
                          child: subscribers.whenOrNull(
                                data: (data) {
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    itemExtent: 30,
                                    itemBuilder: (context, index) {
                                      final sub = data[index];
                                      final bgColor = sub.name == currentProfile
                                          ? MacosColors.controlAccentColor.withOpacity(0.3)
                                          : index % 2 == 0
                                              ? Colors.white
                                              : MacosColors.systemGrayColor.withOpacity(0.1);
                                      return GestureDetector(
                                        child: Container(
                                          color: bgColor,
                                          padding: const EdgeInsets.symmetric(vertical: 6),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 64,
                                                alignment: Alignment.center,
                                                child: Text(sub.name == currentProfile ? "✓" : " ",
                                                    style: typography.body),
                                              ),
                                              Flexible(
                                                  flex: 1,
                                                  child: Container(
                                                      alignment: Alignment.center,
                                                      child: Text(
                                                        sub.name,
                                                        style: typography.body,
                                                      ))),
                                              Flexible(
                                                  flex: 1,
                                                  child: Container(
                                                      alignment: Alignment.center,
                                                      child: Text(
                                                        sub.url == null ? "本地配置" : "远程配置",
                                                        style: typography.body,
                                                      ))),
                                              Flexible(
                                                  flex: 4,
                                                  child: Container(
                                                      alignment: Alignment.center,
                                                      child: Text(
                                                        "共 ${sub.proxiesNum} 个代理，${sub.rulesNum} 条规则",
                                                        style: typography.body,
                                                      ))),
                                            ],
                                          ),
                                        ),
                                        onTap: () {
                                          // selectIndex.value = index;
                                          ref.read(appConfigProvider.notifier).setCurrentProfile(name: sub.name);
                                        },
                                      );
                                    },
                                    itemCount: data.length,
                                  );
                                },
                              ) ??
                              const SizedBox.shrink()),
                    ],
                  ))),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Row(
              children: [
                PushButton(
                  secondary: true,
                  controlSize: ControlSize.regular,
                  onPressed: () async {
                    await ref.read(clashProfileSubscriberProvider.notifier).importFormFile();
                    // ref.read(appConfigProvider.notifier).setCurrentProfile(subscribers.value![selectIndex.value].name);
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text("导入…"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: PushButton(
                    secondary: true,
                    controlSize: ControlSize.regular,
                    onPressed: () {
                      showMacosSheet(
                          context: context,
                          barrierDismissible: true,
                          barrierColor: const Color(0x36212121),
                          builder: (_) {
                            return const ImportUrlProfileDialog();
                          });
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text("从 URL 安装配置…"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: PushButton(
                    secondary: true,
                    controlSize: ControlSize.regular,
                    onPressed: () {
                      showMacosSheet(
                          context: context,
                          barrierDismissible: true,
                          barrierColor: const Color(0x36212121),
                          builder: (_) {
                            return RenameProfileDialog(
                              onNameModify: (newName) {
                                ref
                                    .read(clashProfileSubscriberProvider.notifier)
                                    .renameProfile(oldName: currentProfile!, newName: newName);
                                Navigator.of(context).pop();
                              },
                            );
                          });
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text("重命名…"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: PushButton(
                    secondary: true,
                    controlSize: ControlSize.regular,
                    onPressed: () {
                      ref.read(clashProfileSubscriberProvider.notifier).removeCurrent();
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text("删除"),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      onNegative: () {
        Navigator.of(context).pop();
      },
      onPositive: () {
        Navigator.of(context).pop();
      },
    );
  }
}
