import 'package:http/http.dart' as http;
import 'package:chopper/chopper.dart';
import 'package:json_serializable_chopper_converter/json_serializable_chopper_converter.dart';
import 'package:test/test.dart';

abstract class BaseModel {
  const BaseModel();
  Map<String, dynamic> toJson();
}

class MockModel extends BaseModel {
  final String id;
  final String name;

  const MockModel({
    required this.id,
    required this.name,
  });

  factory MockModel.fromJson(Map<String, dynamic> json) {
    return MockModel(
      id: json['id'] as String,
      name: json['name'] as String,
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}

class ErrorModel {
  final String error;

  const ErrorModel({
    required this.error,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      error: json['error'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'error': error,
      };
}

class Paginator<T extends BaseModel> {
  final List<T> items;

  const Paginator({
    required this.items,
  });

  factory Paginator.fromJson(Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJson) {
    return Paginator(
      items: (json['items'] as List).map((e) => fromJson(e as Map<String, dynamic>)).toList(),
    );
  }

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) => {
        'items': items.map((T val) => val.toJson()).toList(),
      };
}

void main() {
  group('JsonSerilizableConverter', () {
    const converter = JsonSerializableConverter(
      {
        MockModel: MockModel.fromJson,
      },
      errorFactory: ErrorModel.fromJson,
    );
    test('convert request', () {
      var request = Request(
        HttpMethod.Post,
        Uri.parse('https://foo/'),
        Uri.parse(''),
        body: '{}',
      );
      request = converter.convertRequest(request);
      expect(request.body, '{}');
    });

    test('convert response', () async {
      const string = '{"id":"00000000-0000-0000-0000-000000000000","name":"foo"}';
      final response = Response(http.Response(string, 200), string);
      final convertedResponse = await converter.convertResponse<MockModel, MockModel>(response);

      expect(convertedResponse.body?.id, equals("00000000-0000-0000-0000-000000000000"));
      expect(convertedResponse.body?.name, equals('foo'));
    });

    test('convert list response', () async {
      const string = '[{"id":"00000000-0000-0000-0000-000000000000","name":"foo"}]';
      final response = Response(http.Response(string, 200), string);
      final convertedResponse = await converter.convertResponse<List<MockModel>, MockModel>(response);

      expect(convertedResponse.body, isA<List>());
      expect(convertedResponse.body?.first, isA<MockModel>());
      expect(convertedResponse.body?.length, equals(1));
    });

    test('convert error response', () async {
      const string = '{"error":"foo"}';
      final response = Response(http.Response(string, 400), string);
      final convertedResponse = await converter.convertError(response);

      expect(
        convertedResponse.body,
        isA<ErrorModel>().having((e) => e.error, 'error', 'foo'),
      );
    });

    test('convert without error factory', () async {
      const string = '{"error":"foo"}';
      final response = Response(http.Response(string, 400), string);
      const otherConverter = JsonSerializableConverter(
        {
          MockModel: MockModel.fromJson,
        },
      );
      final convertedResponse = await otherConverter.convertError(response);

      expect(convertedResponse.body, isA<Map<String, dynamic>>().having((e) => e['error'], 'error', 'foo'));
    });
  });
}
