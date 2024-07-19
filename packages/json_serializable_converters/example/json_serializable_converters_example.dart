import 'dart:io';

import 'package:json_annotation/json_annotation.dart';
import 'package:json_serializable_converters/json_serializable_converters.dart';

part 'json_serializable_converters_example.g.dart';

enum TestEnum { value1, value2 }

@JsonSerializable(converters: [
  BytesConverter(),
  DateTimeConverter(),
  DurationConverter(),
  UriConverter(),
  FileConverter(),
  DirectoryConverter(),
  EnumConverter(TestEnum.values),
])
class Model {
  final DateTime dateTime;
  final Duration duration;
  final Uri uri;
  final List<int> bytes;
  final File file;
  final Directory directory;
  final TestEnum enumValue;

  Model(this.dateTime, this.duration, this.uri, this.bytes, this.file, this.directory, this.enumValue);

  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);
  Map<String, dynamic> toJson() => _$ModelToJson(this);
}

void main() {}
