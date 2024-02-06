import 'package:contextual_menu/contextual_menu.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FlowCard extends HookConsumerWidget {
  const FlowCard(
      {super.key,
      required this.headerLabel,
      required this.mainText,
      required this.footerLabel,
      this.onClick,
      this.isSelected = false,
      this.footerColor,
      this.menuTriggerButton,
      this.menu});
  final String headerLabel;
  final String mainText;
  final String footerLabel;
  final void Function()? onClick;
  final bool? isSelected;
  final int? menuTriggerButton;
  final Color Function(String)? footerColor;
  final Menu? menu;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: menuTriggerButton == kPrimaryMouseButton
          ? () {
              // menuTrigger(menuKey);
              if (menu != null) popUpContextualMenu(menu!);
            }
          : onClick,
      onSecondaryTap: menuTriggerButton == kSecondaryMouseButton
          ? () {
              // menuTrigger(menuKey);
              if (menu != null) popUpContextualMenu(menu!);
            }
          : null,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Color((isSelected!) ? 0xffe3f2fd : 0xfff5f5f5),
            border: Border.all(color: Color(isSelected! ? 0xff90caf9 : 0xffe8e2e1), width: 0.7)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  headerLabel,
                  style: const TextStyle(fontSize: 10, color: Color(0xffb4b5b7)),
                ),
              ],
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(top: 3, bottom: 3),
              child: Text(
                mainText,
                style: const TextStyle(fontSize: 12, color: Color(0xff424242), fontWeight: FontWeight.w600),
                maxLines: 2,
                overflow: TextOverflow.clip,
              ),
            )),
            Text(
              footerLabel,
              style: TextStyle(
                  fontSize: 10, color: footerColor != null ? footerColor!(footerLabel) : const Color(0xffb4b5b7)),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
