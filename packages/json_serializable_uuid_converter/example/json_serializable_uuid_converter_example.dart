import 'package:json_annotation/json_annotation.dart';
import 'package:json_serializable_uuid_converter/json_serializable_uuid_converter.dart';
import 'package:uuid/uuid.dart';

part 'json_serializable_uuid_converter_example.g.dart';

@JsonSerializable(converters: [
  UuidValueConverter(),
])
class Model {
  final UuidValue uuid;

  Model(this.uuid);

  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);
  Map<String, dynamic> toJson() => _$ModelToJson(this);
}

void main() {}
