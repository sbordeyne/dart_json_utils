// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_serializable_chopper_converter_example.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Paginator<T> _$PaginatorFromJson<T extends APIModel>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    Paginator<T>(
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>).map(fromJsonT).toList(),
    );

Map<String, dynamic> _$PaginatorToJson<T extends APIModel>(
  Paginator<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results.map(toJsonT).toList(),
    };

PostResource _$PostResourceFromJson(Map<String, dynamic> json) => PostResource(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      body: json['body'] as String,
      userId: (json['user_id'] as num).toInt(),
    );

Map<String, dynamic> _$PostResourceToJson(PostResource instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'user_id': instance.userId,
    };

PostCreateBody _$PostCreateBodyFromJson(Map<String, dynamic> json) =>
    PostCreateBody(
      title: json['title'] as String,
      body: json['body'] as String,
      userId: (json['user_id'] as num).toInt(),
    );

Map<String, dynamic> _$PostCreateBodyToJson(PostCreateBody instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'user_id': instance.userId,
    };
