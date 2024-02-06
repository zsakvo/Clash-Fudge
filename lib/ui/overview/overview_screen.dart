import 'package:clash_fudge/app_provider.dart';
import 'package:clash_fudge/ui/overview/components/switch_card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';

class OverviewScreen extends StatefulHookConsumerWidget {
  const OverviewScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends ConsumerState<OverviewScreen> {
  @override
  Widget build(BuildContext context) {
    final typography = MacosTypography.of(context);
    final isSysProxy = ref.watch(appConfigProvider.select((data) => data.value?.isSysProxy)) ?? false;
    final tunEnable = ref.watch(appConfigProvider.select((data) => data.value?.core.tun.enable)) ?? false;
    final allowLan = ref.watch(appConfigProvider.select((data) => data.value?.core.allowLan)) ?? false;
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(top: 18, left: 0),
            child: Text(
              '概览',
              style: typography.largeTitle.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              "网络接管",
              style: TextStyle(
                color: Color(0xff9c27b0),
                fontSize: 13,
              ),
            ),
          ),
          const Divider(
            color: Color(0xfff2f2f2),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: SwitchCard(
                      title: "系统代理",
                      value: isSysProxy,
                      desc: '大多数应用的流量可以通过将 Clash 设置为系统代理接管，具有最新的兼容性和性能',
                      onChanged: (value) {
                        ref.read(appConfigProvider.notifier).setSysProxy();
                      },
                    ),
                  ),
                  SwitchCard(
                    title: "Tun 模式",
                    value: tunEnable,
                    desc: "部分应用可能不遵循系统代理设置，使用Tun 模式可以让所有应用由 Clash 处理。",
                    onChanged: (value) {
                      ref.read(appConfigProvider.notifier).setTun(status: value);
                    },
                  )
                ],
              )),
          const Padding(
            padding: EdgeInsets.only(top: 32),
            child: Text(
              "局域网设备接管",
              style: TextStyle(
                color: Color(0xff5856D6),
                fontSize: 13,
              ),
            ),
          ),
          const Divider(
            color: Color(0xfff2f2f2),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Row(
                children: [
                  SwitchCard(
                    title: "HTTP & SOCKS5代理",
                    desc: "Clash 可以被其他设备用作标准的 HTTP 和 SOCKS5 代理服务器",
                    value: allowLan,
                    onChanged: (value) {
                      // ref.read(appConfigProvider.notifier).setBool(key: 'allowLan', value: value);
                      ref.read(appConfigProvider.notifier).setAllowLan(value);
                    },
                  )
                ],
              )),
          const Padding(
            padding: EdgeInsets.only(top: 32),
            child: Text(
              "外部控制",
              style: TextStyle(
                color: Color(0xff217AFF),
                fontSize: 13,
              ),
            ),
          ),
          const Divider(
            color: Color(0xfff2f2f2),
          ),
          const Padding(
              padding: EdgeInsets.only(top: 12),
              child: Row(
                children: [
                  SwitchCard(
                    title: "远程控制器",
                    value: true,
                    desc: "开启次选项后将允许从其他的控制台对 Clash 内核进行访问和调控。",
                  )
                ],
              )),
        ]));
  }
}
