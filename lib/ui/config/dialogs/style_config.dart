import 'package:clash_fudge/app_provider.dart';
import 'package:clash_fudge/components/dialog_sheet/dialog_sheet.dart';
import 'package:clash_fudge/models/app_config.dart';
import 'package:clash_fudge/ui/config/components/config_row.dart';
import 'package:clash_fudge/ui/config/config_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';

class StyleConfig extends StatefulHookConsumerWidget {
  const StyleConfig({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StyleConfigState();
}

class _StyleConfigState extends ConsumerState<StyleConfig> {
  @override
  Widget build(BuildContext context) {
    // final typography = MacosTypography.of(context);
    final sysTrayShow = ref.watch(sysTrayShowProvider);
    final trayClick = ref.watch(trayClickProvider);
    return DialogSheet(
      title: "外观",
      subtitle: "菜单栏图标以及 Dock 相关的配置",
      width: 864,
      height: 300,
      child: Column(
        children: [
          ConfigRow(
            label: "界面风格",
            childWidth: 200,
            padding: const EdgeInsets.only(top: 6, bottom: 12),
            child: MacosPopupButton(
              items: const [
                MacosPopupMenuItem(
                  value: 0,
                  child: Text("Cupertino"),
                ),
                MacosPopupMenuItem(
                  value: 1,
                  enabled: false,
                  child: Text("Fluent"),
                ),
                MacosPopupMenuItem(
                  value: 2,
                  enabled: false,
                  child: Text("Material"),
                ),
              ],
              value: 0,
              onChanged: (value) {},
            ),
          ),
          ConfigRow(
            label: "菜单栏图标",
            childWidth: 200,
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: MacosPopupButton(
              items: const [
                MacosPopupMenuItem(
                  value: SysTrayShow.all,
                  child: Text("显示图标和实时速度"),
                ),
                MacosPopupMenuItem(
                  value: SysTrayShow.icon,
                  child: Text("仅显示图标"),
                ),
                // MacosPopupMenuItem(
                //   value: 2,
                //   child: Text("仅显示实时速度"),
                // ),
              ],
              value: sysTrayShow,
              onChanged: (value) {
                ref.read(appConfigProvider.notifier).setShowSysTray(value!);
                Navigator.of(context).pop();
              },
            ),
          ),
          ConfigRow(
            label: "菜单栏图标",
            childWidth: 200,
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: MacosPopupButton(
              items: const [
                MacosPopupMenuItem(
                  value: SysTrayClick.menu,
                  child: Text("点击左键显示菜单"),
                ),
                MacosPopupMenuItem(
                  value: SysTrayClick.window,
                  child: Text("点击左键显示主窗口"),
                ),
              ],
              value: trayClick,
              onChanged: (value) {
                ref.read(appConfigProvider.notifier).setTrayClick(value!);
              },
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
