import 'package:json_annotation/json_annotation.dart';

part 'base_negative.g.dart';

@JsonSerializable()
class BaseNegative {
  final int code;
  final String message;
  BaseNegative(this.code, this.message);

  factory BaseNegative.fromJson(Map<String, dynamic> json) =>
      _$BaseNegativeFromJson(json);

  Map<String, dynamic> toJson() => _$BaseNegativeToJson(this);

  factory BaseNegative.None() => BaseNegative(0, "");
}
