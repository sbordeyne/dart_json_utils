import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:json_serializable_flutter_converters/json_serializable_flutter_converters.dart';

part 'json_serializable_flutter_converters_example.g.dart';

@JsonSerializable(converters: [
  SizeConverter(),
  DateTimeRangeConverter(),
  ColorConverter(),
])
class Model {
  final Color color;
  final DateTimeRange dateTimeRange;
  final Size size;

  Model({
    required this.color,
    required this.dateTimeRange,
    required this.size,
  });

  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);
  Map<String, dynamic> toJson() => _$ModelToJson(this);
}

void main() {}
