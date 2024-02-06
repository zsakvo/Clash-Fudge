import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'clash_memory.freezed.dart';
part 'clash_memory.g.dart';

@freezed
class ClashMemory with _$ClashMemory {
  const factory ClashMemory({
    @JsonKey(name: 'inuse') int? inuse,
    @JsonKey(name: 'oslimit') int? oslimit,
  }) = _ClashMemory;

  factory ClashMemory.fromJson(Map<String, Object?> json) => _$ClashMemoryFromJson(json);
}
