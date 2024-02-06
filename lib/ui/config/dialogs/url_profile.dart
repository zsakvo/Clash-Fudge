import 'package:clash_fudge/components/dialog_sheet/dialog_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:clash_fudge/ui/config/config_provider.dart';
import 'package:macos_ui/macos_ui.dart';

class ImportUrlProfileDialog extends StatefulHookConsumerWidget {
  const ImportUrlProfileDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ImportUrlProfileDialogState();
}

class _ImportUrlProfileDialogState extends ConsumerState<ImportUrlProfileDialog> {
  @override
  Widget build(BuildContext context) {
    final urlController = useTextEditingController(text: "");
    final nameController = useTextEditingController(text: "");
    return DialogSheet(
      title: "添加订阅",
      width: 600,
      height: 218,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("订阅地址："),
                Flexible(
                  child: MacosTextField(
                    placeholder: '在此处键入你的订阅链接',
                    textAlignVertical: TextAlignVertical.top,
                    maxLines: 1,
                    controller: urlController,
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("订阅名称："),
              Flexible(
                child: MacosTextField(
                  placeholder: '自定义你的订阅名称',
                  textAlignVertical: TextAlignVertical.top,
                  maxLines: 1,
                  controller: nameController,
                ),
              )
            ],
          ),
        ],
      ),
      onPositive: () {
        ref.read(clashProfileSubscriberProvider.notifier).importFromUrl(
              url: urlController.text,
              name: nameController.text,
            );
        Navigator.of(context).pop();
      },
    );
  }
}
