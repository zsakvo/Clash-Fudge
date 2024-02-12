import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';

class InfoCard extends HookConsumerWidget {
  const InfoCard(
      {super.key,
      required this.title,
      required this.iconName,
      required this.mainText,
      required this.subText,
      required this.labelColor});
  final String title;
  final String iconName;
  final dynamic mainText;
  final dynamic subText;
  final Color labelColor;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          constraints: const BoxConstraints(
            minWidth: 148,
            minHeight: 76,
          ),
          decoration: BoxDecoration(color: const Color(0xFFF1F1F1), borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.only(left: 16, top: 10, bottom: 10, right: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: SvgPicture.asset("assets/icon/$iconName.svg",
                        width: 15, colorFilter: ColorFilter.mode(labelColor, BlendMode.srcIn)),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: constraints.maxWidth - 32 - 16 - 4 - 15),
                    child: Text(
                      title,
                      style: TextStyle(color: labelColor, fontSize: 12),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
              RichText(
                  text: TextSpan(style: const TextStyle(color: MacosColors.black, height: 1.4), children: [
                TextSpan(text: mainText.toString(), style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
                TextSpan(text: "\t$subText", style: const TextStyle(fontSize: 13))
              ]))
            ],
          ),
        );
      },
    );
  }
}
