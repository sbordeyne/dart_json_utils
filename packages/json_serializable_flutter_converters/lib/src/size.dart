import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

class NullableSizeConverter implements JsonConverter<Size?, Map<String, double>?> {
  const NullableSizeConverter();

  @override
  Size? fromJson(Map<String, double>? json) => json == null ? null : Size(json['width']!, json['height']!);

  @override
  Map<String, double>? toJson(Size? object) => object == null ? null : <String, double>{'width': object.width, 'height': object.height};
}

class SizeConverter extends JsonConverter<Size, Map<String, double>> {
  const SizeConverter();

  static NullableSizeConverter nullable() => NullableSizeConverter();

  @override
  Size fromJson(Map<String, double> json) => Size(json['width']!, json['height']!);

  @override
  Map<String, double> toJson(Size object) => <String, double>{'width': object.width, 'height': object.height};
}
