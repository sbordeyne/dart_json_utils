import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

class NullableDateTimeRangeConverter implements JsonConverter<DateTimeRange?, Map<String, String>?> {
  const NullableDateTimeRangeConverter();

  @override
  DateTimeRange? fromJson(Map<String, String>? json) => json == null
      ? null
      : DateTimeRange(
          start: DateTime.parse(json['start']!),
          end: DateTime.parse(json['end']!),
        );

  @override
  Map<String, String>? toJson(DateTimeRange? object) => object == null
      ? null
      : {
          'start': object.start.toIso8601String(),
          'end': object.end.toIso8601String(),
        };
}

class DateTimeRangeConverter implements JsonConverter<DateTimeRange, Map<String, String>> {
  const DateTimeRangeConverter();

  static NullableDateTimeRangeConverter nullable() => NullableDateTimeRangeConverter();

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
