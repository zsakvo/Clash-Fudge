import 'package:clash_fudge/android_app_provider.dart';
import 'package:clash_fudge/providers/activity_provider.dart';
import 'package:clash_fudge/providers/config_provider.dart';
import 'package:clash_fudge/ui/activity/android/components/info_card.dart';
import 'package:clash_fudge/ui/activity/android/components/traffic_card.dart';
import 'package:clash_fudge/utils/math.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
    final currentProfileName = ref.watch(androidAppConfigProvider.select((value) => value.value?.currentProfile));
    final snapshot = ref.watch(snapshotProvider);
    final traffic = ref.watch(trafficProvider);
    final coreLoaded = ref.watch(androidCoreLoadedProvider);
    final currentProfile = currentProfileName == null
        ? null
        : ref.watch(clashProfileSubscriberProvider
            .select((value) => value.value?.firstWhere((element) => element.name == currentProfileName)));
    final chart = ref.watch(chartProvider);
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
                      Padding(
                        padding: EdgeInsets.only(bottom: 0),
                        child: Row(
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
                              vpnRunning ? "VPN 服务运行中" : "VPN 服务未启动",
                              style: textTheme.titleMedium,
                            ),
                            const Spacer(),
                            // vpnRunning
                            //     ? FilledButton.icon(
                            //         onPressed: () {
                            //           ref.read(androidAppConfigProvider.notifier).setVpn(status: !vpnRunning);
                            //         },
                            //         style: ButtonStyle(
                            //           backgroundColor: MaterialStateProperty.all(colorScheme.primaryContainer),
                            //           foregroundColor: MaterialStateProperty.all(colorScheme.onBackground),
                            //           padding: MaterialStateProperty.all(
                            //               const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
                            //         ),
                            //         icon: const Icon(
                            //           Icons.check,
                            //           size: 20,
                            //         ),
                            //         label: const Text("正在运行"),
                            //       )
                            //     : OutlinedButton.icon(
                            //         style: ButtonStyle(
                            //           side: MaterialStateProperty.all(BorderSide(color: colorScheme.primary)),
                            //           padding: MaterialStateProperty.all(
                            //               const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
                            //         ),
                            //         onPressed: () {
                            //           ref.read(androidAppConfigProvider.notifier).setVpn(status: !vpnRunning);
                            //         },
                            //         icon: const Icon(
                            //           Icons.close,
                            //           size: 18,
                            //         ),
                            //         label: const Text("尚未启动"))
                          ],
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 12, left: 8, bottom: 16),
                      //   child: Text(
                      //     currentProfile == null
                      //         ? "暂时未设定当前策略，请配置后点击下方按钮尝试启动服务"
                      //         : "当前配置：$currentProfileName\n共包含${currentProfile.proxiesNum}个节点，${currentProfile.rulesNum}条规则",
                      //     style: textTheme.labelLarge?.copyWith(height: 1.8),
                      //   ),
                      // ),
                      // vpnRunning
                      //     ? FilledButton.icon(
                      //         onPressed: () {
                      //           ref.read(androidAppConfigProvider.notifier).setVpn(status: !vpnRunning);
                      //         },
                      //         style: ButtonStyle(
                      //           backgroundColor: MaterialStateProperty.all(colorScheme.primaryContainer),
                      //           foregroundColor: MaterialStateProperty.all(colorScheme.primary),
                      //           padding:
                      //               MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
                      //         ),
                      //         icon: const Icon(
                      //           Icons.check,
                      //           size: 20,
                      //         ),
                      //         label: const Text("正在运行"),
                      //       )
                      //     : OutlinedButton.icon(
                      //         style: ButtonStyle(
                      //           side: MaterialStateProperty.all(BorderSide(color: colorScheme.primary)),
                      //           padding:
                      //               MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
                      //         ),
                      //         onPressed: () {
                      //           ref.read(androidAppConfigProvider.notifier).setVpn(status: !vpnRunning);
                      //         },
                      //         icon: const Icon(
                      //           Icons.close,
                      //           size: 18,
                      //         ),
                      //         label: const Text("尚未启动"))
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
                selected: const <int>{2},
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
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            sliver: SliverGrid.count(
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              crossAxisCount: 2,
              childAspectRatio: 1.5,
              children: [
                InfoCard(
                    label: "外部端口", value: coreLoaded.whenOrNull(data: (data) => data.toString()), icon: "building"),
                InfoCard(
                    label: "活跃链接",
                    value: snapshot.whenOrNull(
                      data: (data) => data.connections?.length.toString(),
                    ),
                    icon: "building"),
                InfoCard(
                    label: "流量合计",
                    tupleValue: snapshot.whenOrNull(
                        data: (data) => MathUtil.getFlowTuple(data.downloadTotal + data.uploadTotal)),
                    icon: "rfid"),
                TrafficeCard(
                  label: "网络速度",
                  icon: "voiceprint",
                  up: traffic.whenOrNull(
                    data: (data) => data[0],
                  ),
                  down: traffic.whenOrNull(
                    data: (data) => data[1],
                  ),
                )
              ],
            ),
          ),
          // SliverPadding(
          //     padding: const EdgeInsets.only(left: 18, top: 8),
          //     sliver: SliverToBoxAdapter(
          //         child: Text(
          //       "实时流量",
          //       style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, color: colorScheme.secondary),
          //     ))),
          // SliverPadding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16),
          //   sliver: SliverToBoxAdapter(
          //       child: SizedBox(
          //     height: 150,
          //     child: FlowChart(
          //       color: Colors.green,
          //       // backgroundColor: colorScheme.secondaryContainer.withOpacity(0.4),
          //       borderColor: Colors.transparent,
          //       label: "上传",
          //       values: chart.value?.ups ?? [],
          //       labels: chart.value?.upLabels ?? [],
          //     ),
          //   )),
          // ),
          // SliverPadding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          //   sliver: SliverToBoxAdapter(
          //       child: SizedBox(
          //     height: 150,
          //     child: FlowChart(
          //       color: Colors.red,
          //       // backgroundColor: colorScheme.secondaryContainer.withOpacity(0.4),
          //       borderColor: Colors.transparent,
          //       label: "下载",
          //       values: chart.value?.downs ?? [],
          //       labels: chart.value?.downLabels ?? [],
          //     ),
          //   )),
          // ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref.read(androidAppConfigProvider.notifier).setVpn(status: !vpnRunning);
          },
          elevation: 0,
          child: Icon(vpnRunning ? Icons.stop : Icons.play_arrow)),
    );
  }
}
