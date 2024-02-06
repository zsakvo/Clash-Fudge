import 'package:clash_fudge/enums/type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InfoLog extends HookConsumerWidget {
  const InfoLog({super.key, required this.subtitle, required this.content, this.level = AppLogLevel.INFO});
  final AppLogLevel level;
  final String subtitle;
  final String content;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hintColor = useMemoized(() {
      late Color color;
      switch (level) {
        case AppLogLevel.INFO:
          color = const Color(0xff78909c);
          break;
        case AppLogLevel.WARNING:
          color = const Color(0xffffee58);
          break;
        case AppLogLevel.ERROR:
          color = const Color(0xffff7043);
          break;
        case AppLogLevel.SUCCESS:
          color = const Color(0xff8bc34a);
        default:
          color = const Color(0xff78909c);
      }
      return color;
    }, [level]);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: RichText(
          textAlign: TextAlign.start,
          text: TextSpan(children: [
            WidgetSpan(
                child: Container(
              margin: const EdgeInsets.only(bottom: 4.3, right: 4),
              decoration: BoxDecoration(color: hintColor, borderRadius: BorderRadius.circular(30)),
              width: 4,
              height: 4,
            )),
            TextSpan(
                text: "INFO\t\t",
                style: TextStyle(
                  color: hintColor,
                  fontSize: 10,
                )),
            TextSpan(
                text: subtitle,
                style: const TextStyle(
                  color: Color(0xff9e9e9e),
                  fontSize: 10,
                )),
            const TextSpan(
                text: "\n \n",
                style: TextStyle(
                  height: 1,
                  fontSize: 3,
                )),
            TextSpan(text: content, style: const TextStyle(color: Color(0xff424242), fontSize: 11))
          ])),
    );
  }
}
