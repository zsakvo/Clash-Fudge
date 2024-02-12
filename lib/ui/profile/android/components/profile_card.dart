import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileCard extends HookConsumerWidget {
  const ProfileCard({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme.apply(displayColor: Theme.of(context).colorScheme.onSurface);

    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        // color
        side: BorderSide(color: colorScheme.primary.withOpacity(0.4)),
      ),
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 22,
                    height: 22,
                    margin: const EdgeInsets.only(right: 8),
                    child: SvgPicture.asset("assets/icon/file-text.svg",
                        colorFilter: ColorFilter.mode(colorScheme.secondary, BlendMode.srcIn)),
                  ),
                  Text("Clash_Profile", style: textTheme.titleMedium?.copyWith(color: colorScheme.secondary)),
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    "本地配置",
                    style: textTheme.headlineMedium?.copyWith(
                      color: colorScheme.primary,
                    ),
                  ))
            ],
          )),
    );
  }
}
