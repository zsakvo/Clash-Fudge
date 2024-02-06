import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';

class ConfigRow extends HookConsumerWidget {
  const ConfigRow(
      {super.key,
      this.padding,
      required this.label,
      required this.child,
      this.childWidth,
      this.crossAxisAlignment = CrossAxisAlignment.center});
  final EdgeInsets? padding;
  final String label;
  final Widget child;
  final double? childWidth;
  final CrossAxisAlignment? crossAxisAlignment;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final typography = MacosTypography.of(context);
    return Container(
      padding: padding,
      child: Row(
        crossAxisAlignment: crossAxisAlignment!,
        children: [
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "$label：",
                style: typography.body,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: childWidth == null
                ? Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: child,
                  )
                : Row(
                    children: [
                      Container(padding: const EdgeInsets.only(left: 4), width: childWidth, child: child),
                      const Spacer()
                    ],
                  ),
          )
        ],
      ),
    );
  }
}
