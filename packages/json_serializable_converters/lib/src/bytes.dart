import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

class BytesConverter implements JsonConverter<List<int>, String> {
  const BytesConverter();

  @override
  List<int> fromJson(String json) => base64Decode(json);

  @override
  String toJson(List<int> object) => base64Encode(object);
}