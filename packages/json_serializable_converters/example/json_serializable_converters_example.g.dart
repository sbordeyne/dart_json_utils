// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_serializable_converters_example.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Model _$ModelFromJson(Map<String, dynamic> json) => Model(
      const DateTimeConverter().fromJson(json['dateTime'] as String),
      const DurationConverter().fromJson((json['duration'] as num).toInt()),
      const UriConverter().fromJson(json['uri'] as String),
      const BytesConverter().fromJson(json['bytes'] as String),
      const FileConverter().fromJson(json['file'] as String),
      const DirectoryConverter().fromJson(json['directory'] as String),
      $enumDecode(_$TestEnumEnumMap, json['enumValue']),
    );

Map<String, dynamic> _$ModelToJson(Model instance) => <String, dynamic>{
      'dateTime': const DateTimeConverter().toJson(instance.dateTime),
      'duration': const DurationConverter().toJson(instance.duration),
      'uri': const UriConverter().toJson(instance.uri),
      'bytes': const BytesConverter().toJson(instance.bytes),
      'file': const FileConverter().toJson(instance.file),
      'directory': const DirectoryConverter().toJson(instance.directory),
      'enumValue': _$TestEnumEnumMap[instance.enumValue]!,
    };

const _$TestEnumEnumMap = {
  TestEnum.value1: 'value1',
  TestEnum.value2: 'value2',
};
