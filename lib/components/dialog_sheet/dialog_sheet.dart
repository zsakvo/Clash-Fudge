import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';

class DialogSheet extends HookConsumerWidget {
  const DialogSheet(
      {super.key,
      this.width = 480,
      this.height = 218,
      required this.title,
      required this.child,
      this.contentPadding,
      this.subtitle,
      this.onPositive,
      this.onNegative,
      this.positiveText,
      this.negativeText});
  final double width;
  final double height;
  final String title;
  final String? subtitle;
  final Widget child;
  final EdgeInsets? contentPadding;
  final Function()? onPositive;
  final Function()? onNegative;
  final String? positiveText;
  final String? negativeText;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final typography = MacosTypography.of(context);
    final size = MediaQuery.of(context).size;
    return MacosSheet(
        insetPadding:
            EdgeInsets.symmetric(horizontal: (size.width - width) * 0.5, vertical: (size.height - height) / 2),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                    padding: const EdgeInsets.only(left: 24, top: 16, bottom: 14),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        if (subtitle != null)
                          Text(
                            subtitle!,
                            style: typography.subheadline
                                .copyWith(color: MacosColors.systemGrayColor.withOpacity(0.7), height: 2),
                          ),
                      ],
                    )),
                Expanded(
                    child: Container(
                        constraints: const BoxConstraints.expand(),
                        padding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                        decoration: const BoxDecoration(
                          border: Border(top: BorderSide(color: Color(0xffEEEEEE), width: 1)),
                          color: Color(0xffFAFAFA),
                        ),
                        child: child)),
                Container(
                  height: 46,
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (onNegative != null)
                        PushButton(
                            onPressed: onNegative,
                            secondary: true,
                            controlSize: ControlSize.regular,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(negativeText ?? "取消"),
                            )),
                      const SizedBox(
                        width: 12,
                      ),
                      if (onPositive != null)
                        PushButton(
                            onPressed: onPositive,
                            controlSize: ControlSize.regular,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(positiveText ?? "确定"),
                            ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
