import 'package:json_serializable_uuid_converter/json_serializable_uuid_converter.dart';
import 'package:test/test.dart';
import 'package:uuid/uuid_value.dart';

void main() {
  group('UuidValueConverter', () {
    test('toJson', () {
      final converter = UuidValueConverter(validate: false);
      final uuid = UuidValue.nil;
      final json = converter.toJson(uuid);
      expect(json, uuid.uuid);
    });

    test('fromJson', () {
      final converter = UuidValueConverter(validate: false);
      final json = '123e4567-e89b-12d3-a456-426614174000';
      final uuid = converter.fromJson(json);
      expect(uuid.uuid, json);
    });

    test('toJson with validation', () {
      final converter = UuidValueConverter(validate: true);
      final uuid = UuidValue.nil;
      final json = converter.toJson(uuid);
      expect(json, uuid.uuid);
    });

    test('fromJson with validation', () {
      final converter = UuidValueConverter(validate: true);
      final json = '123e4567-e89b-12d3-a456-426614174000';
      final uuid = converter.fromJson(json);
      expect(uuid.uuid, json);
    });

    test('nullable toJson', () {
      final converter = UuidValueConverter.nullable(validate: false);
      final uuid = UuidValue.nil;
      final json = converter.toJson(uuid);
      expect(json, uuid.uuid);
      expect(converter.toJson(null), isNull);
    });

    test('nullable fromJson', () {
      final converter = UuidValueConverter.nullable(validate: false);
      final json = '123e4567-e89b-12d3-a456-426614174000';
      final uuid = converter.fromJson(json);
      expect(uuid!.uuid, json);
      expect(converter.fromJson(null), isNull);
    });

    test('nullable toJson with validation', () {
      final converter = UuidValueConverter.nullable(validate: true);
      final uuid = UuidValue.nil;
      final json = converter.toJson(uuid);
      expect(json, uuid.uuid);
      expect(converter.toJson(null), isNull);
    });

    test('nullable fromJson with validation', () {
      final converter = UuidValueConverter.nullable(validate: true);
      final json = '123e4567-e89b-12d3-a456-426614174000';
      final uuid = converter.fromJson(json);
      expect(uuid!.uuid, json);
      expect(converter.fromJson(null), isNull);
    });
  });
}
