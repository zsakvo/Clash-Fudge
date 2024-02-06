import 'package:clash_fudge/ui/activity/activity_provider.dart';
import 'package:clash_fudge/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';

import 'components/detail.dart';

class ConnectionsScreen extends StatefulHookConsumerWidget {
  const ConnectionsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ConnectionsScreenState();
}

class _ConnectionsScreenState extends ConsumerState<ConnectionsScreen> {
  final border = BorderSide(color: MacosColors.systemGrayColor.withOpacity(0.3));
  @override
  Widget build(BuildContext context) {
    final typography = MacosTypography.of(context);
    final connections = ref.watch(snapshotProvider);
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(top: 18, left: 24, bottom: 12),
            child: Text(
              '连接',
              style: typography.largeTitle.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: MacosColors.systemGrayColor.withOpacity(0.3),
                      ),
                      borderRadius: BorderRadius.circular(6)),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 26,
                            width: 64,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(border: Border(bottom: border, right: border)),
                            child: Text(
                              'ID',
                              style: typography.subheadline,
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                              height: 26,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(border: Border(bottom: border, right: border)),
                              child: Text(
                                '时间',
                                style: typography.subheadline,
                              ),
                            ),
                          ),
                          Flexible(
                              flex: 1,
                              child: Container(
                                height: 26,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(border: Border(bottom: border, right: border)),
                                child: Text(
                                  '策略',
                                  style: typography.subheadline,
                                ),
                              )),
                          Flexible(
                            flex: 1,
                            child: Container(
                              height: 26,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(border: Border(bottom: border, right: border)),
                              child: Text(
                                '上传',
                                style: typography.subheadline,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                              height: 26,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(border: Border(bottom: border, right: border)),
                              child: Text(
                                '下载',
                                style: typography.subheadline,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                              height: 26,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(border: Border(bottom: border, right: border)),
                              child: Text(
                                '地址',
                                style: typography.subheadline,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                              height: 26,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(border: Border(bottom: border, right: border)),
                              child: Text(
                                '端口',
                                style: typography.subheadline,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                              height: 26,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(border: Border(bottom: border)),
                              child: Text(
                                '类型',
                                style: typography.subheadline,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                          child: connections.whenOrNull(
                                data: (data) {
                                  final conns = data.connections ?? [];
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    itemExtent: 30,
                                    itemBuilder: (context, index) {
                                      final con = conns[index];
                                      final bgColor =
                                          index % 2 == 0 ? Colors.white : MacosColors.systemGrayColor.withOpacity(0.1);
                                      return GestureDetector(
                                        child: Container(
                                          color: bgColor,
                                          padding: const EdgeInsets.symmetric(vertical: 6),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 64,
                                                alignment: Alignment.center,
                                                child: Text(index.toString(), style: typography.body),
                                              ),
                                              Flexible(
                                                  flex: 1,
                                                  child: Container(
                                                      alignment: Alignment.center,
                                                      child: Text(
                                                        getTimeString(con.start),
                                                        style: typography.body,
                                                      ))),
                                              Flexible(
                                                  flex: 1,
                                                  child: Container(
                                                      alignment: Alignment.center,
                                                      child: Text(
                                                        con.rule,
                                                        style: typography.body,
                                                      ))),
                                              Flexible(
                                                  flex: 1,
                                                  child: Container(
                                                      alignment: Alignment.center,
                                                      child: Text(
                                                        con.upload.toString(),
                                                        style: typography.body,
                                                      ))),
                                              Flexible(
                                                  flex: 1,
                                                  child: Container(
                                                      alignment: Alignment.center,
                                                      child: Text(
                                                        con.download.toString(),
                                                        style: typography.body,
                                                      ))),
                                              Flexible(
                                                  flex: 1,
                                                  child: Container(
                                                      alignment: Alignment.center,
                                                      child: Text(
                                                        con.metadata.host,
                                                        style: typography.body,
                                                      ))),
                                              Flexible(
                                                  flex: 1,
                                                  child: Container(
                                                      alignment: Alignment.center,
                                                      child: Text(
                                                        con.metadata.destinationPort,
                                                        style: typography.body,
                                                      ))),
                                              Flexible(
                                                  flex: 1,
                                                  child: Container(
                                                      alignment: Alignment.center,
                                                      child: Text(
                                                        con.metadata.type,
                                                        style: typography.body,
                                                      ))),
                                            ],
                                          ),
                                        ),
                                        onTap: () {
                                          showMacosSheet(
                                              context: context,
                                              barrierDismissible: true,
                                              barrierColor: MacosColors.systemGrayColor.withOpacity(0.2),
                                              builder: (_) {
                                                return ConnectionDetail(
                                                  connection: con,
                                                );
                                              });
                                        },
                                      );
                                    },
                                    itemCount: conns.length,
                                  );
                                },
                              ) ??
                              const SizedBox.shrink())
                    ],
                  )))
        ]));
  }
}
