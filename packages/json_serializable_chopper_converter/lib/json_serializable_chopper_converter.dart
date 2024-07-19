library json_serializable_chopper_converter;

import 'dart:async';

import 'package:chopper/chopper.dart';

typedef JsonFactory<T> = T Function(Map<String, dynamic> json);

class JsonSerializableConverter extends JsonConverter {
  final Map<Type, JsonFactory> factories;
  final JsonFactory? errorFactory;

  const JsonSerializableConverter(this.factories, {this.errorFactory});

  ResultType? _decodeMap<ResultType>(Map<String, dynamic> values) {
    /// Get jsonFactory using Type parameters
    /// if not found or invalid, throw error or return null
    final fromJson = factories[ResultType];
    if (fromJson == null || fromJson is! JsonFactory<ResultType>) {
      /// throw serializer not found error;
      return null;
    }

    return fromJson(values);
  }

  List<Item> _decodeList<ResultType, Item>(Iterable values) => values.where((v) => v != null).map<Item>((v) => _decode<Item, Item>(v)).toList();

  dynamic _decode<ResultType, Item>(entity) {
    if (entity is Map) {
      return _decodeMap<ResultType>(entity as Map<String, dynamic>);
    }
    if (entity is Iterable) {
      return _decodeList<ResultType, Item>(entity as List);
    }

    return entity;
  }

  @override
  FutureOr<Response<ResultType>> convertResponse<ResultType, Item>(
    Response response,
  ) async {
    // use [JsonConverter] to decode json
    final jsonRes = await super.convertResponse(response);
    final decodedBody = _decode<ResultType, Item>(jsonRes.body);
    return jsonRes.copyWith<ResultType>(body: decodedBody);
  }

  @override
  // all objects should implements toJson method
  // ignore: unnecessary_overrides
  Request convertRequest(Request request) => super.convertRequest(request);

  @override
  FutureOr<Response> convertError<ResultType, Item>(Response response) async {
    // use [JsonConverter] to decode json
    final jsonRes = await super.convertError(response);
    if (errorFactory == null) return jsonRes;
    return jsonRes.copyWith(
      body: errorFactory!(jsonRes.body),
    );
  }
}
