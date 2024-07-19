// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_serializable_chopper_converter_example.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$ApiService extends ApiService {
  _$ApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = ApiService;

  @override
  Future<Response<List<PostResource>>> list() {
    final Uri $url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<PostResource>, PostResource>($request);
  }

  @override
  Future<Response<PostResource>> retrieve(int id) {
    final Uri $url =
        Uri.parse('https://jsonplaceholder.typicode.com/posts/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<PostResource, PostResource>($request);
  }

  @override
  Future<Response<PostResource>> post(PostCreateBody body) {
    final Uri $url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<PostResource, PostResource>($request);
  }
}
