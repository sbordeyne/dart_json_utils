// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_serializable_uuid_converter_example.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Model _$ModelFromJson(Map<String, dynamic> json) => Model(
      const UuidValueConverter().fromJson(json['uuid'] as String),
    );

Map<String, dynamic> _$ModelToJson(Model instance) => <String, dynamic>{
      'uuid': const UuidValueConverter().toJson(instance.uuid),
    };
