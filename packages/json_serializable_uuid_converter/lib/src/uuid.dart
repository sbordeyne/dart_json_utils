import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

class NullableUuidValueConverter implements JsonConverter<UuidValue?, String?> {
  const NullableUuidValueConverter({
    this.validate = true,
  });

  final bool validate;

  @override
  UuidValue? fromJson(String? json) {
    if (json == null) {
      return null;
    }
    return validate ? UuidValue.withValidation(json) : UuidValue.raw(json);
  }

  @override
  String? toJson(UuidValue? object) => object?.uuid.toLowerCase();
}

/// JSON converters for [UuidValue].
/// Converts the [UuidValue] to and from a [String].
/// Use the `validate` parameter to enable or disable validation of the UUID.
class UuidValueConverter extends JsonConverter<UuidValue, String> {
  const UuidValueConverter({
    this.validate = true,
  });

  final bool validate;

  static NullableUuidValueConverter nullable({bool validate = true}) => NullableUuidValueConverter(validate: validate);

  @override
  UuidValue fromJson(String json) => validate ? UuidValue.withValidation(json) : UuidValue.raw(json);

  @override
  String toJson(UuidValue object) => object.uuid.toLowerCase();
}
