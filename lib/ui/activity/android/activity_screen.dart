import 'package:clash_fudge/android_app_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../macos/components/flow_chart.dart';

class ActivityScreen extends StatefulHookConsumerWidget {
  const ActivityScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends ConsumerState<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme.apply(displayColor: Theme.of(context).colorScheme.onSurface);
    final vpnRunning = ref.watch(androidAppConfigProvider.select((value) => value.value?.isSysProxy)) ?? false;
    return Scaffold(
      backgroundColor: colorScheme.surfaceVariant.withOpacity(0.2),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            sliver: SliverToBoxAdapter(
                child: Card(
              elevation: 0,
              margin: EdgeInsets.zero,
              color: colorScheme.secondaryContainer.withOpacity(0.4),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            margin: const EdgeInsets.only(right: 12),
                            decoration: BoxDecoration(
                              color: colorScheme.primaryContainer,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: SvgPicture.asset("assets/icon/link.svg",
                                colorFilter: ColorFilter.mode(colorScheme.primary, BlendMode.srcIn)),
                          ),
                          Text(
                            "VPN 服务",
                            style: textTheme.titleMedium,
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12, left: 8),
                        child: Text(
                          "暂时未设定当前策略，请配置后点击下方按钮尝试启动服务",
                          style: textTheme.labelLarge,
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 18, left: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              vpnRunning
                                  ? FilledButton.icon(
                                      onPressed: () {
                                        ref.read(androidAppConfigProvider.notifier).setVpn(status: !vpnRunning);
                                      },
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(colorScheme.primaryContainer),
                                        foregroundColor: MaterialStateProperty.all(colorScheme.primary),
                                        padding: MaterialStateProperty.all(
                                            const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
                                      ),
                                      icon: const Icon(
                                        Icons.check,
                                        size: 20,
                                      ),
                                      label: const Text("正在运行"),
                                    )
                                  : OutlinedButton.icon(
                                      style: ButtonStyle(
                                        side: MaterialStateProperty.all(BorderSide(color: colorScheme.primary)),
                                        padding: MaterialStateProperty.all(
                                            const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
                                      ),
                                      onPressed: () {
                                        ref.read(androidAppConfigProvider.notifier).setVpn(status: !vpnRunning);
                                      },
                                      icon: const Icon(
                                        Icons.close,
                                        size: 18,
                                      ),
                                      label: const Text("尚未启动"))
                            ],
                          ))
                    ],
                  )),
            )),
          ),
          SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              sliver: SliverToBoxAdapter(
                  child: Text(
                "出站模式",
                style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, color: colorScheme.secondary),
              ))),
          SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              sliver: SliverToBoxAdapter(
                  child: SegmentedButton(
                style: ButtonStyle(
                  visualDensity: VisualDensity.compact,
                  side: MaterialStateProperty.all(BorderSide(color: colorScheme.secondaryContainer)),
                ),
                segments: const [
                  ButtonSegment<int>(label: Text('直连'), value: 0),
                  ButtonSegment<int>(label: Text('全局'), value: 1),
                  ButtonSegment<int>(label: Text('规则'), value: 2)
                ],
                selected: const <int>{0},
                onSelectionChanged: (p0) {},
              ))),
          SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              sliver: SliverToBoxAdapter(
                  child: Text(
                "连接信息",
                style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, color: colorScheme.secondary),
              ))),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            sliver: SliverToBoxAdapter(
                child: Row(
              children: [
                Flexible(
                    flex: 1,
                    child: Card(
                      elevation: 0,
                      margin: EdgeInsets.zero,
                      color: colorScheme.secondaryContainer.withOpacity(0.4),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                        child: Row(
                          children: [
                            Container(
                              width: 22,
                              height: 22,
                              margin: const EdgeInsets.only(right: 8),
                              child: SvgPicture.asset("assets/icon/router.svg",
                                  colorFilter: ColorFilter.mode(colorScheme.primary, BlendMode.srcIn)),
                            ),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(text: "212", style: textTheme.titleSmall?.copyWith(color: colorScheme.primary)),
                              TextSpan(text: "\t节点", style: textTheme.titleSmall?.copyWith(color: colorScheme.primary)),
                            ])),
                          ],
                        ),
                      ),
                    )),
                const SizedBox(
                  width: 12,
                ),
                Flexible(
                    flex: 1,
                    child: Card(
                      elevation: 0,
                      margin: EdgeInsets.zero,
                      color: colorScheme.secondaryContainer.withOpacity(0.4),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                        child: Row(
                          children: [
                            Container(
                              width: 22,
                              height: 22,
                              margin: const EdgeInsets.only(right: 8),
                              child: SvgPicture.asset("assets/icon/compass.svg",
                                  colorFilter: ColorFilter.mode(colorScheme.primary, BlendMode.srcIn)),
                            ),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(text: "1109", style: textTheme.titleSmall?.copyWith(color: colorScheme.primary)),
                              TextSpan(text: "\t规则", style: textTheme.titleSmall?.copyWith(color: colorScheme.primary)),
                            ])),
                          ],
                        ),
                      ),
                    )),
              ],
            )),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            sliver: SliverToBoxAdapter(
                child: Card(
              elevation: 0,
              margin: EdgeInsets.zero,
              color: colorScheme.secondaryContainer.withOpacity(0.4),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            margin: const EdgeInsets.only(right: 12),
                            decoration: BoxDecoration(
                              color: colorScheme.primaryContainer,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: SvgPicture.asset("assets/icon/function.svg",
                                colorFilter: ColorFilter.mode(colorScheme.primary, BlendMode.srcIn)),
                          ),
                          Text(
                            "内核数据",
                            style: textTheme.titleMedium,
                          )
                        ],
                      ),
                      const Padding(
                          padding: EdgeInsets.only(top: 12, left: 8),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 6),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("内存占用"),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8),
                                      child: Text("4 MB"),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 6),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("活跃链接"),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8),
                                      child: Text("4 MB"),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 6),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("已上传"),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8),
                                      child: Text("4 MB"),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 6),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("已下载"),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8),
                                      child: Text("4 MB"),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 6),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("总流量"),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8),
                                      child: Text("4 MB"),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ],
                  )),
            )),
          ),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverToBoxAdapter(
                child: SizedBox(
              height: 150,
              child: FlowChart(
                color: Colors.green,
                // backgroundColor: colorScheme.secondaryContainer.withOpacity(0.4),
                borderColor: Colors.transparent,
                label: "上传",
                values: [0, 1, 2, 3, 2, 1, 0],
                labels: ["0KB/s", "1KB/s", "2KB/s", "3KB/s", "2KB/s", "1KB/s", "0KB/s"],
              ),
            )),
          ),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            sliver: SliverToBoxAdapter(
                child: SizedBox(
              height: 150,
              child: FlowChart(
                color: Colors.red,
                // backgroundColor: colorScheme.secondaryContainer.withOpacity(0.4),
                borderColor: Colors.transparent,
                label: "下载",
                values: [0, 1, 2, 3, 2, 1, 0],
                labels: ["0KB/s", "1KB/s", "2KB/s", "3KB/s", "2KB/s", "1KB/s", "0KB/s"],
                // value: trafficFlow.value?.down ?? 0,
                // xScale: 20,
                // yScale: 5,
              ),
            )),
          ),
        ],
      ),
    );
  }
}
