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
  });
}
