import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

class NullableBytesConverter implements JsonConverter<List<int>?, String?> {
  const NullableBytesConverter();

  @override
  List<int>? fromJson(String? json) => json == null ? null : base64Decode(json);

  @override
  String? toJson(List<int>? object) => object == null ? null : base64Encode(object);
}

class BytesConverter implements JsonConverter<List<int>, String> {
  const BytesConverter();

  static NullableBytesConverter nullable() => NullableBytesConverter();

  @override
  List<int> fromJson(String json) => base64Decode(json);

  @override
  String toJson(List<int> object) => base64Encode(object);
}
