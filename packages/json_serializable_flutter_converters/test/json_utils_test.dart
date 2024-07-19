import 'package:flutter/material.dart';
import 'package:test/test.dart';
import 'package:json_serializable_flutter_converters/json_serializable_flutter_converters.dart';

void main() {
  group('ColorConverter', () {
    test('toJson', () {
      final converter = ColorConverter();
      final color = Color(0xFF000000);
      final json = converter.toJson(color);
      expect(json, '#ff000000');
    });

    test('fromJson', () {
      final converter = ColorConverter();
      final json = '#ff000000';
      final color = converter.fromJson(json);
      expect(color, Color(0xFF000000));
    });

    test('fromJsonShort', () {
      final converter = ColorConverter();
      final json = '#000000';
      final color = converter.fromJson(json);
      expect(color, Color(0xFF000000));
    });

    test('fromJsonInvalid', () {
      final converter = ColorConverter();
      final json = '00000';
      expect(() => converter.fromJson(json), throwsArgumentError);
    });
  });

  group('DateTimeRangeConverter', () {
    test('toJson', () {
      final converter = DateTimeRangeConverter();
      final range = DateTimeRange(
        start: DateTime(2021, 1, 1, 0, 0, 0),
        end: DateTime(2021, 1, 2, 0, 0, 0),
      );
      final json = converter.toJson(range);
      expect(json, {
        'start': '2021-01-01T00:00:00.000',
        'end': '2021-01-02T00:00:00.000',
      });
    });

    test('fromJson', () {
      final converter = DateTimeRangeConverter();
      final json = {
        'start': '2021-01-01T00:00:00.000',
        'end': '2021-01-02T00:00:00.000',
      };
      final range = converter.fromJson(json);
      expect(
          range,
          DateTimeRange(
            start: DateTime(2021, 1, 1, 0, 0, 0),
            end: DateTime(2021, 1, 2, 0, 0, 0),
          ));
    });
  });

  group('SizeConverter', () {
    test('toJson', () {
      final converter = SizeConverter();
      final size = Size(1, 2);
      final json = converter.toJson(size);
      expect(json, {'width': 1, 'height': 2});
    });

    test('fromJson', () {
      final converter = SizeConverter();
      final json = {'width': 1.0, 'height': 2.0};
      final size = converter.fromJson(json);
      expect(size, Size(1, 2));
    });
  });
}
