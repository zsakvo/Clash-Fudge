import 'package:clash_fudge/models/clash_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';

import 'logs_provider.dart';

class LogsScreen extends StatefulHookConsumerWidget {
  const LogsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LogsScreenState();
}

class _LogsScreenState extends ConsumerState<LogsScreen> {
  @override
  Widget build(BuildContext context) {
    final typography = MacosTypography.of(context);
    final logs = useState<List<ClashLog>>([]);
    final liveLog = ref.watch(clashLogsProvider);
    liveLog.whenData((value) {
      if (logs.value.length > 100) logs.value.removeLast();
      logs.value.insert(0, value);
    });
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: const EdgeInsets.only(
              top: 18,
              left: 24,
            ),
            child: Text(
              '日志',
              style: typography.largeTitle.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8, left: 24, bottom: 8),
            child: Text(
              "实时日志会倒序显示，最多展示 100 条",
              style: TextStyle(
                color: Color(0xffb3b3b3),
                fontSize: 11,
              ),
            ),
          ),
          Expanded(
              child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: MacosColors.systemGrayColor.withOpacity(0.3),
                      ),
                      borderRadius: BorderRadius.circular(6)),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      final log = logs.value[index];
                      final bgColor = index % 2 == 0 ? Colors.white : MacosColors.systemGrayColor.withOpacity(0.1);
                      return Container(
                          color: bgColor,
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Row(
                            children: [
                              Container(
                                width: 64,
                                alignment: Alignment.center,
                                child: Text(log.type, style: typography.body.copyWith(color: log.typeColor)),
                              ),
                              Flexible(
                                flex: 1,
                                child: Padding(
                                    padding: const EdgeInsets.only(right: 16),
                                    child: Text(
                                      log.payload,
                                      style: typography.body,
                                    )),
                              ),
                            ],
                          ));
                    },
                    itemCount: logs.value.length,
                  )
                  // ListView.separated(
                  //     shrinkWrap: true,
                  //     itemBuilder: (context, index) {
                  //       final log = logs.value[index];
                  //       return ListTile(
                  //         contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
                  //         title: Text(log.type),
                  //         subtitle: Text(log.payload),
                  //       );
                  //     },
                  //     separatorBuilder: (context, index) {
                  //       return const Divider(
                  //         color: Color(0xfff2f2f2),
                  //       );
                  //     },
                  //     itemCount: logs.value.length),
                  )),
        ]));
  }
}
