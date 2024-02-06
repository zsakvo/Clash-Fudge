import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

class LoadError extends StatelessWidget {
  const LoadError({Key? key, required this.error, this.stackTrace}) : super(key: key);

  final Object error;
  final StackTrace? stackTrace;

  @override
  Widget build(BuildContext context) {
    final typography = MacosTypography.of(context);
    return Material(
      color: const Color(0xfff4f4f4),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 72, horizontal: 64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "出现错误",
                  style: typography.title1,
                ),
                const Spacer(),
                PushButton(
                  controlSize: ControlSize.large,
                  onPressed: () {
                    FlutterClipboard.copy("$error\n\n$stackTrace");
                  },
                  child: const Text("复制错误信息"),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                error.toString(),
                style: typography.body.copyWith(color: MacosColors.appleRed),
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Text(
                stackTrace.toString(),
                style: typography.body,
              ),
            ))
          ],
        ),
      ),
    );
  }
}
