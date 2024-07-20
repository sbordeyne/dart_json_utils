import 'package:json_annotation/json_annotation.dart';

class NullableDateTimeConverter implements JsonConverter<DateTime?, String?> {
  const NullableDateTimeConverter();

  @override
  DateTime? fromJson(String? json) => json == null ? null : DateTime.parse(json);

  @override
  String? toJson(DateTime? object) => object?.toIso8601String();
}

class DateTimeConverter implements JsonConverter<DateTime, String> {
  const DateTimeConverter();

  static NullableDateTimeConverter nullable() => NullableDateTimeConverter();

  @override
  DateTime fromJson(String json) => DateTime.parse(json);

  @override
  String toJson(DateTime object) => object.toIso8601String();
}
