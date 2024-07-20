import 'package:json_annotation/json_annotation.dart';

class NullableEnumConverter<T extends Enum> extends JsonConverter<T?, String?> {
  const NullableEnumConverter(this.values);

  final List<T> values;

  @override
  T? fromJson(String? json) {
    if (json == null) {
      return null;
    }
    if (values.any((element) => element.name == json)) {
      return values.firstWhere((element) => element.name == json);
    }
    return null;
  }

  @override
  String? toJson(T? object) {
    return object?.name;
  }
}

class EnumConverter<T extends Enum> extends JsonConverter<T, String> {
  const EnumConverter(this.values);

  final List<T> values;

  static NullableEnumConverter<T> nullable<T extends Enum>(List<T> values) {
    return NullableEnumConverter<T>(values);
  }

  @override
  T fromJson(String json) {
    return values.firstWhere((element) => element.name == json);
  }

  @override
  String toJson(T object) {
    return object.name;
  }
}
