import 'dart:io';

import 'package:clash_fudge/utils/math.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

part 'clash_profile_subscriber.freezed.dart';
part 'clash_profile_subscriber.g.dart';

@freezed
class ClashProfileSubscriber with _$ClashProfileSubscriber {
  @JsonSerializable(explicitToJson: true)
  factory ClashProfileSubscriber({
    required String? url,
    required String name,
    required int interval,
    @JsonKey(name: 'userinfo') @Default(SubUserInfo()) SubUserInfo userinfo,
    required DateTime time,
    int? proxiesNum,
    int? rulesNum,
  }) = _ClashProfileSubscriber;
  const ClashProfileSubscriber._();

  factory ClashProfileSubscriber.fromJson(Map<String, dynamic> json) => _$ClashProfileSubscriberFromJson(json);

  Future<File> get file async => File('${((await getApplicationDocumentsDirectory()).path)}/profiles/$name.yaml');

  String get timeString {
    // return "${time.year}-${time.month}-${time.day} ${time.hour}:${time.minute}:${time.second}";
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(time);
  }
}

@freezed
class SubUserInfo with _$SubUserInfo {
  const factory SubUserInfo({
    @JsonKey(name: 'upload') int? upload,
    @JsonKey(name: 'download') int? download,
    @JsonKey(name: 'total') int? total,
    @JsonKey(name: 'expire') int? expire,
  }) = _SubUserInfo;
  const SubUserInfo._();
  factory SubUserInfo.fromJson(Map<String, dynamic> json) => _$SubUserInfoFromJson(json);

  factory SubUserInfo.fromHeader(String info) {
    var list = info.split(";");
    Map<String, int?> map = {};
    for (var i in list) {
      var j = i.trim().split("=");
      map[j[0]] = int.tryParse(j[1]);
    }
    return SubUserInfo(
      upload: map["upload"],
      download: map["download"],
      total: map["total"],
      expire: map["expire"],
    );
  }

  String get flowInfo {
    return "${MathUtil.getFlow(download ?? 0)} / ${MathUtil.getFlow(total ?? 0)}";
  }
}
