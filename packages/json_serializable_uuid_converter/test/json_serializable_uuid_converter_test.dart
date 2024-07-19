import 'package:json_serializable_uuid_converter/json_serializable_uuid_converter.dart';
import 'package:test/test.dart';
import 'package:uuid/uuid_value.dart';

void main() {
  group('UuidValueConverter', () {
    test('toJson', () {
      final converter = UuidValueConverter();
      final uuid = UuidValue.nil;
      final json = converter.toJson(uuid);
      expect(json, uuid.uuid);
    });

    test('fromJson', () {
      final converter = UuidValueConverter();
      final json = '123e4567-e89b-12d3-a456-426614174000';
      final uuid = converter.fromJson(json);
      expect(uuid.uuid, json);
    });
  });
}
