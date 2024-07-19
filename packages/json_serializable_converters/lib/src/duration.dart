import 'package:json_annotation/json_annotation.dart';

class DurationConverter extends JsonConverter<Duration, int> {
  const DurationConverter();

  @override
  Duration fromJson(int json) => Duration(microseconds: json);

  @override
  int toJson(Duration object) => object.inMicroseconds;
}
