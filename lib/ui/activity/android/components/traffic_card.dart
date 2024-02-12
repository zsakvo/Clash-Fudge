import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TrafficeCard extends HookConsumerWidget {
  const TrafficeCard({super.key, required this.label, required this.icon, this.up, this.down});
  final String label;
  final (String, String)? up;
  final (String, String)? down;
  final String icon;
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
            children: [
              Row(
                children: [
                  Container(
                    width: 22,
                    height: 22,
                    margin: const EdgeInsets.only(right: 8),
                    child: SvgPicture.asset("assets/icon/$icon.svg",
                        colorFilter: ColorFilter.mode(colorScheme.secondary, BlendMode.srcIn)),
                  ),
                  Text(label, style: textTheme.titleMedium?.copyWith(color: colorScheme.secondary)),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  SvgPicture.asset("assets/icon/right-up.svg",
                      width: 18, colorFilter: ColorFilter.mode(colorScheme.primary, BlendMode.srcIn)),
                  const Spacer(),
                  Text(
                    up == null ? "--\t/s" : "${up!.$1}\t${"${up!.$2}/s"}",
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.primary,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset("assets/icon/left-down.svg",
                      width: 18, colorFilter: ColorFilter.mode(colorScheme.primary, BlendMode.srcIn)),
                  const Spacer(),
                  Text(
                    down == null ? "--\t/s" : "${down!.$1}\t${"${down!.$2}/s"}",
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.primary,
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}
