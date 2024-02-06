import 'package:clash_fudge/components/dialog_sheet/dialog_sheet.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';

import '../config_provider.dart';

class LibsConfig extends HookConsumerWidget {
  const LibsConfig({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final typography = MacosTypography.of(context);
    final libs = ref.watch(libsProvider);
    return DialogSheet(
      title: "第三方声明",
      width: 500,
      height: 500,
      contentPadding: const EdgeInsets.only(left: 24, top: 18, bottom: 24),
      child: libs.whenOrNull(
            data: (data) {
              return ListView.separated(
                itemCount: data.length,
                cacheExtent: 32,
                itemBuilder: (context, index) {
                  final lib = data[index];
                  return SizedBox(
                    height: 32,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          lib.$1,
                          style: typography.title2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 24),
                          child: Text(
                            lib.$2,
                            style: typography.body,
                          ),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 18,
                    thickness: 1,
                    endIndent: 24,
                    color: MacosColors.systemGrayColor.withOpacity(0.1),
                  );
                },
              );
            },
          ) ??
          const SizedBox.shrink(),
      onPositive: () {
        Navigator.of(context).pop();
      },
    );
  }
}
