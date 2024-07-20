import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

class NullableFileConverter extends JsonConverter<File?, String?> {
  const NullableFileConverter();

  @override
  File? fromJson(String? json) => json == null ? null : File(json);

  @override
  String? toJson(File? object) => object?.path;
}

class FileConverter extends JsonConverter<File, String> {
  const FileConverter();

  static NullableFileConverter nullable() => NullableFileConverter();

  @override
  File fromJson(String json) => File(json);

  @override
  String toJson(File object) => object.path;
}
