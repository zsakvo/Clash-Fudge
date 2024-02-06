import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';

class ConfigCell extends HookConsumerWidget {
  const ConfigCell({super.key, required this.icon, required this.title, required this.subtitle, this.onTap});
  final String icon;
  final String title;
  final String subtitle;
  final Function()? onTap;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final typography = MacosTypography.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/icon/$icon.png",
            width: 48,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24, left: 4),
            child: Text(
              title,
              style: typography.title3.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 4),
            child: Text(
              subtitle,
              style: typography.callout.copyWith(color: MacosColors.systemGrayColor.withOpacity(0.8)),
            ),
          )
        ],
      ),
    );
  }
}
