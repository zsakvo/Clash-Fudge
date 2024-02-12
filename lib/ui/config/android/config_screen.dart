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
  final titleStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
  final subStyle = TextStyle(fontSize: 14, height: 2);
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme.apply(displayColor: Theme.of(context).colorScheme.onSurface);
    return Scaffold(
      backgroundColor: colorScheme.surfaceVariant.withOpacity(0.2),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              horizontalTitleGap: 24,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              leading: SvgPicture.asset(
                "assets/icon/palette.svg",
                width: 26,
                colorFilter: ColorFilter.mode(colorScheme.primary, BlendMode.srcIn),
              ),
              title: Text(
                "主题颜色",
                style: titleStyle,
              ),
              subtitle: Text(
                "更换应用主题颜色",
                style: subStyle,
              ),
              onTap: () {
                context.push("/palette");
              },
            ),
            ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              horizontalTitleGap: 24,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              leading: SvgPicture.asset(
                "assets/icon/news.svg",
                width: 26,
                colorFilter: ColorFilter.mode(colorScheme.primary, BlendMode.srcIn),
              ),
              title: Text(
                "最近请求",
                style: titleStyle,
              ),
              subtitle: Text(
                "查看最近的请求记录",
                style: subStyle,
              ),
              onTap: () {},
            ),
            ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              horizontalTitleGap: 24,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              leading: SvgPicture.asset(
                "assets/icon/android.svg",
                width: 26,
                colorFilter: ColorFilter.mode(colorScheme.primary, BlendMode.srcIn),
              ),
              title: Text(
                "日志查看",
                style: titleStyle,
              ),
              subtitle: Text(
                "查看内核日志",
                style: subStyle,
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
