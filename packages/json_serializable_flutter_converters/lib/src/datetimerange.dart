import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

class DateTimeRangeConverter implements JsonConverter<DateTimeRange, Map<String, String>> {
  const DateTimeRangeConverter();

  @override
  DateTimeRange fromJson(Map<String, String> json) => DateTimeRange(
    start: DateTime.parse(json['start']!),
    end: DateTime.parse(json['end']!),
  );

  @override
  Map<String, String> toJson(DateTimeRange object) => {
    'start': object.start.toIso8601String(),
    'end': object.end.toIso8601String(),
  };
}