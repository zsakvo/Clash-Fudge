import 'package:freezed_annotation/freezed_annotation.dart';
part 'clash_rule.freezed.dart';
part 'clash_rule.g.dart';

@freezed
class ClashRule with _$ClashRule {
  const factory ClashRule({
    required String type,
    required String payload,
    required String proxy,
    required int size,
  }) = _ClashRule;
  const ClashRule._();
  factory ClashRule.fromJson(Map<String, dynamic> json) => _$ClashRuleFromJson(json);
}
