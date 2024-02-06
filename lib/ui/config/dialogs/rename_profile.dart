import 'package:clash_fudge/components/dialog_sheet/dialog_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';

class RenameProfileDialog extends HookConsumerWidget {
  const RenameProfileDialog({super.key, required this.onNameModify});
  final void Function(String newName) onNameModify;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController(text: "");
    return DialogSheet(
      title: "重命名订阅",
      width: 600,
      height: 176,
      child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("订阅名称："),
            Flexible(
              child: MacosTextField(
                placeholder: '输入新的订阅名称',
                textAlignVertical: TextAlignVertical.top,
                maxLines: 1,
                controller: controller,
              ),
            )
          ],
        )
      ]),
      onPositive: () {
        onNameModify(controller.text);
      },
    );
  }
}
