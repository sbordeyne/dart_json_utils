import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

class NullableDirectoryConverter extends JsonConverter<Directory?, String?> {
  const NullableDirectoryConverter();

  @override
  Directory? fromJson(String? json) => json == null ? null : Directory(json);

  @override
  String? toJson(Directory? object) => object?.path;
}

class DirectoryConverter extends JsonConverter<Directory, String> {
  const DirectoryConverter();

  static NullableDirectoryConverter nullable() => NullableDirectoryConverter();

  @override
  Directory fromJson(String json) => Directory(json);

  @override
  String toJson(Directory object) => object.path;
}
