import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

class SizeConverter extends JsonConverter<Size, Map<String, double>> {
  const SizeConverter();

  @override
  Size fromJson(Map<String, double> json) => Size(json['width']!, json['height']!);

  @override
  Map<String, double> toJson(Size object) => <String, double>{'width': object.width, 'height': object.height};
}
