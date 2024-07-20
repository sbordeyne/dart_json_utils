import 'package:json_annotation/json_annotation.dart';

class NullableDurationConverter extends JsonConverter<Duration?, int?> {
  const NullableDurationConverter();

  @override
  Duration? fromJson(int? json) => json == null ? null : Duration(microseconds: json);

  @override
  int? toJson(Duration? object) => object?.inMicroseconds;
}

class DurationConverter extends JsonConverter<Duration, int> {
  const DurationConverter();

  static NullableDurationConverter nullable() => NullableDurationConverter();

  @override
  Duration fromJson(int json) => Duration(microseconds: json);

  @override
  int toJson(Duration object) => object.inMicroseconds;
}
