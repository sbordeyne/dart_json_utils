import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';

class NullableColorConverter extends JsonConverter<Color?, String?> {
  const NullableColorConverter();

  @override
  Color? fromJson(String? json) => json == null ? null : const ColorConverter().fromJson(json);

  @override
  String? toJson(Color? object) => object == null ? null : const ColorConverter().toJson(object);
}

class ColorConverter extends JsonConverter<Color, String> {
  const ColorConverter();

  static NullableColorConverter nullable() => NullableColorConverter();

  @override
  Color fromJson(String json) {
    if (json.startsWith('#')) {
      if (json.length == 7) {
        // No alpha, need to add it as 0xFF
        return Color(int.parse(json.substring(1, 7), radix: 16) | 0xFF000000);
      }
      return Color(int.parse(json.substring(1, 9), radix: 16));
    }
    throw ArgumentError.value(json, 'color', 'Invalid color');
  }

  @override
  String toJson(Color object) => '#${object.value.toRadixString(16)}';
}
