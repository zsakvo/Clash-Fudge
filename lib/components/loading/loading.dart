import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';

class AppLoading extends HookConsumerWidget {
  const AppLoading({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        color: MacosColors.windowFrameColor.withOpacity(0.3),
        alignment: Alignment.center,
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(color: MacosColors.windowFrameColor, borderRadius: BorderRadius.circular(6)),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: ProgressCircle(
                    radius: 7,
                  ),
                ),
                Text('加载中...'),
              ],
            )));
  }
}
