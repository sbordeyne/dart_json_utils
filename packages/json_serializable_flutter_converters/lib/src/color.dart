import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';

class ColorConverter extends JsonConverter<Color, String> {
  const ColorConverter();

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
