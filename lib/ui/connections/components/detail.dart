import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:clash_fudge/components/dialog_sheet/dialog_sheet.dart';
import 'package:clash_fudge/models/clash_snapshot.dart';
import 'package:clash_fudge/request/http.dart';
import 'package:macos_ui/macos_ui.dart';

class ConnectionDetail extends HookConsumerWidget {
  const ConnectionDetail({super.key, required this.connection});
  final Connection connection;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final typography = MacosTypography.of(context);
    final renderConn = connection.toJson()
      ..addAll(connection.metadata.toJson())
      ..remove('metadata');
    return DialogSheet(
      title: "连接详情",
      width: 640,
      height: 480,
      contentPadding: const EdgeInsets.only(left: 24, top: 18, bottom: 18),
      negativeText: '关闭连接',
      onNegative: () {
        Http.closeConnection(connection.id);
        Navigator.of(context).pop();
      },
      onPositive: () {
        Navigator.of(context).pop();
      },
      child: SingleChildScrollView(
        child: Column(
            children: renderConn.keys.map((key) {
          return Padding(
            padding: const EdgeInsets.only(right: 24, bottom: 4, top: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$key:\t\t",
                  style: typography.body.copyWith(fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: Text(
                    renderConn[key].toString(),
                    style: typography.body,
                  ),
                )
              ],
            ),
          );
        }).toList()),
      ),
    );
  }
}
