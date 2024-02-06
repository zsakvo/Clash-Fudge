import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddCard extends HookConsumerWidget {
  const AddCard({super.key, required this.onClick});
  final void Function() onClick;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onClick,
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(6),
        color: const Color(0xffE0E0E0),
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            child: Center(
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: const Color(0xffe0e0e0),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                  child: SvgPicture.asset(
                    "assets/icon/add.svg",
                    width: 18,
                    colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  )),
            )),
      ),
    );
  }
}
