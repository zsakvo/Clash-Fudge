import 'package:clash_fudge/android_app_provider.dart';
import 'package:clash_fudge/providers/activity_provider.dart';
import 'package:clash_fudge/providers/strategy_provider.dart';
import 'package:clash_fudge/providers/vpn_provider.dart';
import 'package:clash_fudge/ui/activity/android/components/info_card.dart';
import 'package:clash_fudge/ui/activity/android/components/traffic_card.dart';
import 'package:clash_fudge/utils/math.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
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
    final snapshot = ref.watch(snapshotProvider);
    final traffic = ref.watch(trafficProvider);
    final coreLoaded = ref.watch(androidCoreLoadedProvider);
    final vpnStatus = ref.watch(vpnStatusProvider);
    final hasProfile = ref.watch(strategeyProvider).whenOrNull(
              data: (data) => data?.$2.isNotEmpty,
            ) ??
        false;
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
                          padding: const EdgeInsets.only(bottom: 0),
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
                                vpnStatus.valueOrNull ?? false ? "VPN 服务运行中" : "VPN 服务未启动",
                                style: textTheme.titleMedium,
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
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
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            hasProfile
                ? ref.read(vpnStatusProvider.notifier).toggleVpn()
                : showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("错误"),
                        content: const Text("请至少导入并选定一个配置文件后再启动服务"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              context.pop();
                            },
                            child: const Text("确定"),
                          ),
                        ],
                      );
                    },
                  );
          },
          elevation: 0,
          child: vpnStatus.when(
            data: (data) {
              return Icon((vpnStatus.value ?? false) ? Icons.stop : Icons.play_arrow);
            },
            error: (error, stackTrace) {
              return const Icon(Icons.play_arrow);
            },
            loading: () {
              return const Padding(
                padding: EdgeInsets.all(18),
                child: CircularProgressIndicator(
                  strokeWidth: 2.4,
                ),
              );
            },
          ),
        ));
  }
}
