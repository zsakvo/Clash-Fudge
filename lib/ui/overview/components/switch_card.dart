import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';

class SwitchCard extends StatefulHookConsumerWidget {
  const SwitchCard(
      {super.key,
      required this.title,
      required this.desc,
      this.negativeDesc = "已禁用",
      this.positiveDesc = "已启用",
      this.onChanged,
      this.value = false,
      this.disable = false});
  final String title;
  final String desc;
  final String negativeDesc;
  final String positiveDesc;
  final bool value;
  final void Function(bool value)? onChanged;
  final bool? disable;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SwitchCardState();
}

class _SwitchCardState extends ConsumerState<SwitchCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 110,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xfff5f5f5),
          border: Border.all(color: const Color(0xffE8E2E1), width: 1)),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
              ),
              MacosSwitch(
                value: widget.value,
                size: ControlSize.small,
                onChanged: widget.onChanged,
              )
            ],
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              widget.desc,
              style: const TextStyle(fontSize: 11, color: Color(0xff7b7b7b)),
            ),
          )),
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.only(right: 6),
                decoration: BoxDecoration(
                    color: (widget.value ? MacosColors.systemGreenColor : MacosColors.systemOrangeColor),
                    borderRadius: BorderRadius.circular(30)),
              ),
              Text(
                widget.value ? widget.positiveDesc : widget.negativeDesc,
                style: const TextStyle(color: Color(0xff4E4E4E), fontSize: 11),
              )
            ],
          )
        ],
      ),
    );
  }
}
