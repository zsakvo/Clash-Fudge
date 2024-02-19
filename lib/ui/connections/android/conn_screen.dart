import 'package:clash_fudge/providers/activity_provider.dart';
import 'package:clash_fudge/request/http.dart';
import 'package:clash_fudge/utils/log.dart';
import 'package:clash_fudge/utils/math.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConnScreen extends StatefulHookConsumerWidget {
  const ConnScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ConnScreenState();
}

class _ConnScreenState extends ConsumerState<ConnScreen> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final conns = ref.watch(snapshotProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text("当前连接"),
          titleSpacing: 0,
        ),
        body: conns.whenOrNull(
          data: (data) {
            final conns = data.connections ?? [];
            return ListView.separated(
                itemBuilder: (context, index) {
                  final conn = conns[index];
                  return ListTile(
                    title: Text(conn.id),
                    subtitle: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text:
                              "${conn.metadata.sourceIP}${conn.metadata.sourcePort}\t-->\t${conn.metadata.destinationIP}${conn.metadata.destinationPort}",
                          style: TextStyle(fontSize: 13, color: colorScheme.onSurface.withOpacity(0.6), height: 1.7)),
                      TextSpan(
                          text: "\nstart time:\t${DateTime.parse(conn.start)}\n",
                          style: TextStyle(fontSize: 13, color: colorScheme.onSurface.withOpacity(0.6), height: 1.7)),
                      TextSpan(
                          text: "节点链：${conn.chains.reversed.join("\t→\t")}\n",
                          style: TextStyle(fontSize: 13, color: colorScheme.onSurface.withOpacity(0.6), height: 1.7)),
                      TextSpan(
                          text: "下载：${MathUtil.getFlow(conn.download)}/s\t\t\t上传：${MathUtil.getFlow(conn.upload)}/s",
                          style: TextStyle(fontSize: 13, color: colorScheme.onSurface.withOpacity(0.6), height: 1.7))
                    ])),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          // 是否关闭当前连接
                          return AlertDialog(
                            title: const Text("关闭"),
                            content: const Text("是否关闭当前连接？"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("取消")),
                              TextButton(
                                  onPressed: () {
                                    Http.closeConnection(conn.id);
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("确定"))
                            ],
                          );
                        },
                      );
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    indent: 18,
                    endIndent: 18,
                    color: colorScheme.secondaryContainer.withOpacity(0.6),
                  );
                },
                itemCount: conns.length);
          },
        ));
  }
}
