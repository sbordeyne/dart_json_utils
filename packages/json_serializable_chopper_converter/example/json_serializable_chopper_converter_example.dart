// ignore_for_file: avoid_print

import 'package:chopper/chopper.dart';
import 'package:json_serializable_chopper_converter/json_serializable_chopper_converter.dart';
import 'package:json_annotation/json_annotation.dart' hide JsonConverter;

part 'json_serializable_chopper_converter_example.g.dart';
part 'json_serializable_chopper_converter_example.chopper.dart';

abstract class APIModel {
  const APIModel();
  Map<String, dynamic> toJson();
}

@JsonSerializable(
  genericArgumentFactories: true,
)
class Paginator<T extends APIModel> extends APIModel {
  const Paginator({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  final int count;
  final String? next;
  final String? previous;
  final List<T> results;

  factory Paginator.fromJson(Map<String, dynamic> json, JsonFactory jsonFactory) =>
      _$PaginatorFromJson<T>(json, (json) => jsonFactory(json as Map<String, dynamic>) as T);
  @override
  Map<String, dynamic> toJson() => _$PaginatorToJson(this, (T value) => value.toJson());
}

@JsonSerializable()
class PostResource extends APIModel {
  final int id;
  final String title;
  final String body;
  @JsonKey(name: 'user_id')
  final int userId;

  const PostResource({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
  });

  factory PostResource.fromJson(Map<String, dynamic> json) =>
      _$PostResourceFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PostResourceToJson(this);
}

@JsonSerializable()
class PostCreateBody extends APIModel {
  final String title;
  final String body;
  @JsonKey(name: 'user_id')
  final int userId;

  const PostCreateBody({
    required this.title,
    required this.body,
    required this.userId,
  });

  factory PostCreateBody.fromJson(Map<String, dynamic> json) =>
      _$PostCreateBodyFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PostCreateBodyToJson(this);
}

@ChopperApi(baseUrl: 'https://jsonplaceholder.typicode.com')
abstract class ApiService extends ChopperService {
  @Get(path: '/posts')
  Future<Response<List<PostResource>>> list();

  @Get(path: '/posts/{id}')
  Future<Response<PostResource>> retrieve(@Path('id') int id);

  @Post(path: '/posts')
  Future<Response<PostResource>> post(
    @Body() PostCreateBody body,
  );

  static ApiService create() {
    final client = ChopperClient(
      services: [
        _$ApiService(),
      ],
      interceptors: const [
        HeadersInterceptor(
          {
            'Cache-Control': 'no-cache',
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ),
      ],
      converter: JsonSerializableConverter({
        PostResource: PostResource.fromJson,
        Paginator<PostResource>: (json) => Paginator<PostResource>.fromJson(json, PostResource.fromJson),
        PostCreateBody: PostCreateBody.fromJson,
      }),
    );

    return _$ApiService(client);
  }
}

void main() async {
  final apiService = ApiService.create();

  final response = await apiService.list();
  print(response.body!.map((e) => e.toJson()));
}
