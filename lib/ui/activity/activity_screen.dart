import 'package:clash_fudge/app_provider.dart';
import 'package:clash_fudge/enums/type.dart';
import 'package:clash_fudge/hooks/window_listener.dart';
import 'package:clash_fudge/ui/activity/components/flow_chart.dart';
import 'package:clash_fudge/ui/rules/rules_provider.dart';
import 'package:clash_fudge/utils/constant.dart';
import 'package:clash_fudge/utils/math.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:macos_ui/macos_ui.dart' hide MacosSegmentedControl, MacosTab;

import 'activity_provider.dart';
import 'components/info_card.dart';
import 'components/info_log.dart';

class ActivityScreen extends StatefulHookConsumerWidget {
  const ActivityScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends ConsumerState<ActivityScreen> {
  final tabPadding = const EdgeInsets.symmetric(horizontal: 32, vertical: 1);
  @override
  Widget build(BuildContext context) {
    final closed = useIsWindowClosed();
    final coreLoaded = ref.watch(coreLoadedProvider).value ?? false;
    final typography = MacosTypography.of(context);
    final snapshot = closed ? null : ref.watch(snapshotProvider);
    final chart = closed ? null : ref.watch(chartProvider);
    final isSysProxy = ref.watch(appConfigProvider.select((data) => data.value?.isSysProxy)) ?? false;
    final tunEnable = ref.watch(appConfigProvider.select((data) => data.value?.core.tun.enable)) ?? false;
    final memoryUsage = ref.watch(clashMemoryProvider);
    final matchProxyDelay = ref.watch(matchProxyDelayProvider);
    final proxyNum = ref.watch(clashProxiesProvider.select((data) => data.value?.$1.length)) ?? 0;
    final rulesNum = ref.watch(rulesProvider.select((data) => data.value?.length));
    final port = ref.watch(appConfigProvider.select((data) => data.value?.core.port)) ?? "--";
    final socksPort = ref.watch(appConfigProvider.select((data) => data.value?.core.socksPort)) ?? "--";
    final mixedPort = ref.watch(appConfigProvider.select((data) => data.value?.core.mixedPort)) ?? "--";
    final controlPort = coreLoaded ? Const.clashPort : "--";
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Text(
              '活动',
              style: typography.largeTitle.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 24),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 980),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: InfoCard(
                            title: "节点",
                            mainText: proxyNum.toString(),
                            subText: "个",
                            iconName: 'router',
                            labelColor: MacosColors.systemGreenColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: InfoCard(
                            title: "规则",
                            mainText: (rulesNum ?? 0).toString(),
                            subText: "条",
                            iconName: 'compass',
                            labelColor: MacosColors.systemPinkColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: InfoCard(
                            title: "内存",
                            mainText: memoryUsage.value?.$1 ?? "0",
                            subText: memoryUsage.value?.$2 ?? "B",
                            iconName: 'dribbble',
                            labelColor: MacosColors.controlAccentColor,
                          ),
                        ),
                        Expanded(
                            child: InfoCard(
                          title: matchProxyDelay.value?.$1 ?? "当前节点",
                          mainText: matchProxyDelay.value?.$2 ?? "--",
                          subText: "ms",
                          iconName: 'link',
                          labelColor: MacosColors.systemOrangeColor,
                        ))
                      ],
                    ),
                  );
                },
              )),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Divider(
              color: MacosColors.systemGrayColor.withOpacity(0.16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: snapshot?.whenOrNull(
              data: (data) {
                final down = MathUtil.getFlowTuple(data.downloadTotal);
                final up = MathUtil.getFlowTuple(data.uploadTotal);
                final all = MathUtil.getFlowTuple(data.downloadTotal + data.uploadTotal);
                return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  buildInfoText("上传", up.$1, up.$2),
                  buildInfoText("下载", down.$1, down.$2),
                  buildInfoText("总计", all.$1, all.$2),
                  buildInfoText("活跃链接", data.connections?.length.toString() ?? "0", "")
                ]);
              },
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Text(
                          "实时流量",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: FlowChart(
                          color: const Color(0xFF27B055),
                          label: "上传",
                          values: chart?.value?.ups ?? [],
                          labels: chart?.value?.upLabels ?? [],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: FlowChart(
                          color: const Color(0xff2196f3),
                          label: "下载",
                          values: chart?.value?.downs ?? [],
                          labels: chart?.value?.downLabels ?? [],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Text(
                          "事件",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                      InfoLog(
                        subtitle: '2024/1/21 10:14:45',
                        content: '混合代理服务已启动，监听在 127.0.0.1，端口号 $port',
                        level: AppLogLevel.SUCCESS,
                      ),
                      InfoLog(
                        subtitle: '2024/1/21 10:14:46',
                        content: 'SOCKS5 代理服务已启动，监听在 127.0.0.1，端口号 $socksPort',
                        level: AppLogLevel.SUCCESS,
                      ),
                      InfoLog(
                        subtitle: '2024/1/21 10:14:47',
                        content: 'HTTP 代理服务已启动，监听在 127.0.0.1，端口号 $mixedPort',
                        level: AppLogLevel.SUCCESS,
                      ),
                      InfoLog(
                        subtitle: 'CLASH-FUDGE',
                        content: '内核已成功启动，RESTFUL-API 端口为 $controlPort',
                        level: AppLogLevel.SUCCESS,
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 48,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: PushButton(
                                  secondary: true,
                                  onPressed: () {
                                    ref.read(appConfigProvider.notifier).setSysProxy();
                                  },
                                  controlSize: ControlSize.regular,
                                  child: Padding(
                                      padding: const EdgeInsets.only(top: 3),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 8,
                                            height: 8,
                                            decoration: BoxDecoration(
                                                color: isSysProxy
                                                    ? MacosColors.systemGreenColor
                                                    : MacosColors.systemOrangeColor,
                                                borderRadius: BorderRadius.circular(30)),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 36),
                                            child: Text("系统代理"),
                                          )
                                        ],
                                      ))),
                            ),
                            PushButton(
                                secondary: true,
                                onPressed: () {
                                  ref.read(appConfigProvider.notifier).setTun();
                                },
                                controlSize: ControlSize.regular,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 3),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 8,
                                        height: 8,
                                        decoration: BoxDecoration(
                                            color: tunEnable
                                                ? MacosColors.systemGreenColor
                                                : MacosColors.systemOrangeColor,
                                            borderRadius: BorderRadius.circular(30)),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 36),
                                        child: Text("Tun 模式"),
                                      )
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }

  buildInfoText(String title, String value, String desc) {
    return Expanded(
      flex: 1,
      child: RichText(
          text: TextSpan(style: const TextStyle(color: MacosColors.black), children: [
        TextSpan(text: title, style: TextStyle(color: MacosColors.systemGrayColor.withOpacity(0.6), fontSize: 10)),
        const TextSpan(text: "\n \n", style: TextStyle(fontSize: 4, height: 1)),
        TextSpan(text: value, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 22)),
        TextSpan(text: "\t$desc", style: const TextStyle(fontSize: 12))
      ])),
    );
  }
}
