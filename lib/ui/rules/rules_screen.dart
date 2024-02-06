import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';

import 'rules_provider.dart';

class RulesScreen extends StatefulHookConsumerWidget {
  const RulesScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RulesScreenState();
}

class _RulesScreenState extends ConsumerState<RulesScreen> {
  final border = BorderSide(color: MacosColors.systemGrayColor.withOpacity(0.3));
  @override
  Widget build(BuildContext context) {
    final typography = MacosTypography.of(context);
    final rules = ref.watch(rulesProvider);
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(top: 18, left: 24),
            child: Text(
              '规则',
              style: typography.largeTitle.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8, left: 24, bottom: 12),
            child: Text(
              "规则将按照从上至下的顺序进行测试",
              style: TextStyle(
                color: Color(0xffb3b3b3),
                fontSize: 11,
              ),
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
                                '类型',
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
                                  '值',
                                  style: typography.subheadline,
                                ),
                              )),
                          Flexible(
                            flex: 1,
                            child: Container(
                              height: 26,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(border: Border(bottom: border)),
                              child: Text(
                                '策略',
                                style: typography.subheadline,
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   height: resizedBoxHeight,
                          //   child: ResizablePane(
                          //     minSize: 80,
                          //     startSize: 200,
                          //     windowBreakpoint: 400,
                          //     resizableSide: ResizableSide.right,
                          //     builder: (_, __) {
                          //       return const Center(
                          //         child: Text('Left Resizable Pane'),
                          //       );
                          //     },
                          //   ),
                          // ),
                        ],
                      ),
                      Expanded(
                          child: rules.whenOrNull(
                                data: (data) {
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    itemExtent: 30,
                                    itemBuilder: (context, index) {
                                      final rule = data[index];
                                      final bgColor =
                                          index % 2 == 0 ? Colors.white : MacosColors.systemGrayColor.withOpacity(0.1);
                                      return Container(
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
                                                      rule.type,
                                                      style: typography.body,
                                                    ))),
                                            Flexible(
                                                flex: 1,
                                                child: Container(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      rule.payload,
                                                      style: typography.body,
                                                    ))),
                                            Flexible(
                                              fit: FlexFit.loose,
                                              child: Container(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    rule.proxy,
                                                    style: typography.body,
                                                  )),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    itemCount: data.length,
                                  );
                                },
                              ) ??
                              const SizedBox.shrink())
                    ],
                  )))
        ]));
  }
}
