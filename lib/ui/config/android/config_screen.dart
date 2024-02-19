import 'package:clash_fudge/providers/geoip_file_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConfigScreen extends StatefulHookConsumerWidget {
  const ConfigScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ConfigScreenState();
}

class _ConfigScreenState extends ConsumerState<ConfigScreen> {
  final titleStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
  final subStyle = const TextStyle(fontSize: 14, height: 2);
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final geoipFile = ref.watch(geoipFileProvider);
    return Scaffold(
      backgroundColor: colorScheme.surfaceVariant.withOpacity(0.2),
      appBar: AppBar(
        leadingWidth: 60,
        titleSpacing: 16,
        title: const Text("设置"),
        backgroundColor: colorScheme.surfaceVariant.withOpacity(0),
        scrolledUnderElevation: 0,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildListTile(
              colorScheme: colorScheme,
              icon: "palette",
              title: "主题颜色",
              subtitle: "更换应用主题颜色",
              onTap: () => context.push("/palette"),
            ),
            buildListTile(colorScheme: colorScheme, icon: "news", title: "最近请求", subtitle: "查看最近的请求记录"),
            buildListTile(
              colorScheme: colorScheme,
              icon: "leaf",
              title: "日志查看",
              subtitle: "查看内核日志",
              onTap: () => context.push("/logs"),
            ),
            buildListTile(
                colorScheme: colorScheme,
                icon: "crosshair",
                title: "更新 GeoIP 数据库",
                subtitle: "更新时间：${geoipFile.whenOrNull(data: (file) => file.lastModifiedSync().toString()) ?? "---"}",
                onTap: () => ref.read(geoipFileProvider.notifier).upgrade()),
          ],
        ),
      ),
    );
  }

  buildListTile(
      {required ColorScheme colorScheme,
      required String icon,
      required String title,
      required String subtitle,
      void Function()? onTap}) {
    return ListTile(
      titleAlignment: ListTileTitleAlignment.center,
      horizontalTitleGap: 24,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      leading: SvgPicture.asset(
        "assets/icon/$icon.svg",
        width: 26,
        colorFilter: ColorFilter.mode(colorScheme.primary, BlendMode.srcIn),
      ),
      title: Text(
        title,
        style: titleStyle,
      ),
      subtitle: Text(
        subtitle,
        style: subStyle,
      ),
      onTap: onTap ?? () {},
    );
  }
}
