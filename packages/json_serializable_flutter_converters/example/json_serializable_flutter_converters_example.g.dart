// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_serializable_flutter_converters_example.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Model _$ModelFromJson(Map<String, dynamic> json) => Model(
      color: const ColorConverter().fromJson(json['color'] as String),
      dateTimeRange: const DateTimeRangeConverter()
          .fromJson(json['dateTimeRange'] as Map<String, String>),
      size: const SizeConverter().fromJson(json['size'] as Map<String, double>),
    );

Map<String, dynamic> _$ModelToJson(Model instance) => <String, dynamic>{
      'color': const ColorConverter().toJson(instance.color),
      'dateTimeRange':
          const DateTimeRangeConverter().toJson(instance.dateTimeRange),
      'size': const SizeConverter().toJson(instance.size),
    };
