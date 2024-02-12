import 'package:freezed_annotation/freezed_annotation.dart';

part 'chart_info.freezed.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ChartInfo with _$ChartInfo {
  const factory ChartInfo({
    required List<int> ups,
    required List<int> downs,
    required List<String> upLabels,
    required List<String> downLabels,
  }) = _ChartInfo;
  const ChartInfo._();
}
