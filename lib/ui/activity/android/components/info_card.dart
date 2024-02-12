import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InfoCard extends HookConsumerWidget {
  const InfoCard({super.key, required this.label, this.value, this.tupleValue, required this.icon});
  final String label;
  final String? value;
  final (String, String)? tupleValue;
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: tupleValue == null
                    ? Text(
                        value ?? "--",
                        style: textTheme.headlineMedium?.copyWith(
                          color: colorScheme.primary,
                        ),
                      )
                    : RichText(
                        text: TextSpan(children: [
                        TextSpan(
                            text: tupleValue!.$1,
                            style: textTheme.headlineMedium?.copyWith(color: colorScheme.primary)),
                        TextSpan(
                            text: "\t${tupleValue!.$2}",
                            style: textTheme.titleSmall?.copyWith(color: colorScheme.primary))
                      ])),
              )
            ],
          )),
    );
  }
}
