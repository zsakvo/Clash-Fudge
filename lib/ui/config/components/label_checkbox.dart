import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';

class LabelCheckbox extends HookConsumerWidget {
  const LabelCheckbox({super.key, required this.label, this.value = false, this.onChanged});

  final bool value;
  final Function(bool)? onChanged;
  final String label;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final typography = MacosTypography.of(context);
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: MacosCheckbox(
            value: value,
            onChanged: onChanged,
          ),
        ),
        Text(label, style: typography.body),
      ],
    );
  }
}
