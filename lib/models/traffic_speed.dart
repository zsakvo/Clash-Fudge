import 'package:clash_fudge/utils/math.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'traffic_speed.freezed.dart';
part 'traffic_speed.g.dart';

@freezed
class TrafficSpeed with _$TrafficSpeed {
  const factory TrafficSpeed({
    @Default(0) int up,
    @Default(0) int down,
  }) = _TrafficSpeed;

  const TrafficSpeed._();

  factory TrafficSpeed.fromJson(Map<String, dynamic> json) => _$TrafficSpeedFromJson(json);

  (String, String) get upStr => MathUtil.getFlowTuple(up);
  (String, String) get downStr => MathUtil.getFlowTuple(down);
}
