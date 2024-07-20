import 'dart:io';

import 'package:json_serializable_converters/json_serializable_converters.dart';
import 'package:test/test.dart';

enum TestEnum {
  one,
  two,
  three,
}

void main() {
  group('BytesConverter', () {
    test('toJson', () {
      final converter = BytesConverter();
      final bytes = [1, 2, 3];
      final json = converter.toJson(bytes);
      expect(json, 'AQID');
    });

    test('fromJson', () {
      final converter = BytesConverter();
      final json = 'AQID';
      final bytes = converter.fromJson(json);
      expect(bytes, [1, 2, 3]);
    });

    test('nullable toJson', () {
      final converter = BytesConverter.nullable();
      final bytes = [1, 2, 3];
      final json = converter.toJson(bytes);
      expect(json, 'AQID');
      expect(converter.toJson(null), isNull);
    });

    test('nullable fromJson', () {
      final converter = BytesConverter.nullable();
      final json = 'AQID';
      final bytes = converter.fromJson(json);
      expect(bytes, [1, 2, 3]);
      expect(converter.fromJson(null), isNull);
    });
  });

  group('EnumConverter', () {
    test('toJson', () {
      final converter = EnumConverter(TestEnum.values);
      final json = converter.toJson(TestEnum.one);
      expect(json, 'one');
    });

    test('fromJson', () {
      final converter = EnumConverter(TestEnum.values);
      final json = 'one';
      final value = converter.fromJson(json);
      expect(value, TestEnum.one);
    });

    test('nullable toJson', () {
      final converter = EnumConverter.nullable(TestEnum.values);
      final json = converter.toJson(TestEnum.one);
      expect(json, 'one');
      expect(converter.toJson(null), isNull);
    });

    test('nullable fromJson', () {
      final converter = EnumConverter.nullable(TestEnum.values);
      final json = 'one';
      final value = converter.fromJson(json);
      expect(value, TestEnum.one);
      expect(converter.fromJson(null), isNull);
      expect(converter.fromJson('four'), isNull);
    });
  });

  group('UriConverter', () {
    test('toJson', () {
      final converter = UriConverter();
      final uri = Uri.parse('https://example.com');
      final json = converter.toJson(uri);
      expect(json, 'https://example.com');
    });

    test('fromJson', () {
      final converter = UriConverter();
      final json = 'https://example.com';
      final uri = converter.fromJson(json);
      expect(uri, Uri.parse('https://example.com'));
    });

    test('nullable toJson', () {
      final converter = UriConverter.nullable();
      final uri = Uri.parse('https://example.com');
      final json = converter.toJson(uri);
      expect(json, 'https://example.com');
      expect(converter.toJson(null), isNull);
    });

    test('nullable fromJson', () {
      final converter = UriConverter.nullable();
      final json = 'https://example.com';
      final uri = converter.fromJson(json);
      expect(uri, Uri.parse('https://example.com'));
      expect(converter.fromJson(null), isNull);
    });
  });

  group('DateTimeConverter', () {
    test('toJson', () {
      final converter = DateTimeConverter();
      final dateTime = DateTime(2021, 1, 1, 0, 0, 0);
      final json = converter.toJson(dateTime);
      expect(json, '2021-01-01T00:00:00.000');
    });

    test('fromJson', () {
      final converter = DateTimeConverter();
      final json = '2021-01-01T00:00:00.000';
      final dateTime = converter.fromJson(json);
      expect(dateTime, DateTime(2021, 1, 1, 0, 0, 0));
    });

    test('nullable toJson', () {
      final converter = DateTimeConverter.nullable();
      final dateTime = DateTime(2021, 1, 1, 0, 0, 0);
      final json = converter.toJson(dateTime);
      expect(json, '2021-01-01T00:00:00.000');
      expect(converter.toJson(null), isNull);
    });

    test('nullable fromJson', () {
      final converter = DateTimeConverter.nullable();
      final json = '2021-01-01T00:00:00.000';
      final dateTime = converter.fromJson(json);
      expect(dateTime, DateTime(2021, 1, 1, 0, 0, 0));
      expect(converter.fromJson(null), isNull);
    });
  });

  group('DurationConverter', () {
    test('toJson', () {
      final converter = DurationConverter();
      final duration = Duration(days: 1);
      final json = converter.toJson(duration);
      expect(json, 86400000000);
    });

    test('fromJson', () {
      final converter = DurationConverter();
      final json = 86400000000;
      final duration = converter.fromJson(json);
      expect(duration, Duration(days: 1));
    });

    test('nullable toJson', () {
      final converter = DurationConverter.nullable();
      final duration = Duration(days: 1);
      final json = converter.toJson(duration);
      expect(json, 86400000000);
      expect(converter.toJson(null), isNull);
    });

    test('nullable fromJson', () {
      final converter = DurationConverter.nullable();
      final json = 86400000000;
      final duration = converter.fromJson(json);
      expect(duration, Duration(days: 1));
      expect(converter.fromJson(null), isNull);
    });
  });

  group('FileConverter', () {
    final filePath = '${Directory.systemTemp}/example.txt';

    test('toJson', () {
      final converter = FileConverter();
      final file = File(filePath);
      final json = converter.toJson(file);
      expect(json, filePath);
    });

    test('fromJson', () {
      final converter = FileConverter();
      final file = converter.fromJson(filePath);
      expect(file, isA<File>().having((file) => file.path, 'path', filePath));
    });

    test('nullable toJson', () {
      final converter = FileConverter.nullable();
      final file = File(filePath);
      final json = converter.toJson(file);
      expect(json, filePath);
      expect(converter.toJson(null), isNull);
    });

    test('nullable fromJson', () {
      final converter = FileConverter.nullable();
      final file = converter.fromJson(filePath);
      expect(file, isA<File>().having((file) => file.path, 'path', filePath));
      expect(converter.fromJson(null), isNull);
    });
  });

  group('DirectoryConverter', () {
    final directoryPath = '${Directory.systemTemp.path}/example';

    test('toJson', () {
      final converter = DirectoryConverter();
      final directory = Directory(directoryPath);
      final json = converter.toJson(directory);
      expect(json, directoryPath);
    });

    test('fromJson', () {
      final converter = DirectoryConverter();
      final directory = converter.fromJson(directoryPath);
      expect(
          directory,
          isA<Directory>()
              .having((directory) => directory.path, 'path', directoryPath));
    });

    test('nullable toJson', () {
      final converter = DirectoryConverter.nullable();
      final directory = Directory(directoryPath);
      final json = converter.toJson(directory);
      expect(json, directoryPath);
      expect(converter.toJson(null), isNull);
    });

    test('nullable fromJson', () {
      final converter = DirectoryConverter.nullable();
      final directory = converter.fromJson(directoryPath);
      expect(
          directory,
          isA<Directory>()
              .having((directory) => directory.path, 'path', directoryPath));
      expect(converter.fromJson(null), isNull);
    });
  });
}
