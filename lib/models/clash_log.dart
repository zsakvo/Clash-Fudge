import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:macos_ui/macos_ui.dart';

part 'clash_log.freezed.dart';
part 'clash_log.g.dart';

@freezed
class ClashLog with _$ClashLog {
  const factory ClashLog({
    required String type,
    required String payload,
  }) = _ClashLog;
  const ClashLog._();
  factory ClashLog.fromJson(Map<String, dynamic> json) => _$ClashLogFromJson(json);

  Color get typeColor {
    switch (type) {
      case 'info':
        return MacosColors.systemGreenColor;
      case 'debug':
        return MacosColors.systemBlueColor;
      case 'warning':
        return MacosColors.systemOrangeColor;
      case 'error':
        return MacosColors.systemRedColor;
      default:
        return MacosColors.systemGrayColor;
    }
  }
}
