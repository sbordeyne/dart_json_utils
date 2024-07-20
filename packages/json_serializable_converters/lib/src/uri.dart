import 'package:json_annotation/json_annotation.dart';

class NullableUriConverter implements JsonConverter<Uri?, String?> {
  const NullableUriConverter();

  @override
  Uri? fromJson(String? json) => json == null ? null : Uri.parse(json);

  @override
  String? toJson(Uri? object) => object?.toString();
}

class UriConverter implements JsonConverter<Uri, String> {
  const UriConverter();

  static NullableUriConverter nullable() => NullableUriConverter();

  @override
  Uri fromJson(String json) => Uri.parse(json);

  @override
  String toJson(Uri object) => object.toString();
}
