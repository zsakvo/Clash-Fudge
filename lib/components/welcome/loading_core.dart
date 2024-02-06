import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';

class LoadingCore extends HookConsumerWidget {
  const LoadingCore({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final typography = MacosTypography.of(context);
    return Material(
      color: const Color(0xfff4f4f4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: ProgressCircle(
              radius: 12,
            ),
          ),
          Text(
            "正在初始化核心……",
            style: typography.body,
          )
        ],
      ),
    );
  }
}
