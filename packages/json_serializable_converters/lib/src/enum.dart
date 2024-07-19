import 'package:json_annotation/json_annotation.dart';

class EnumConverter<T extends Enum> extends JsonConverter<T, String> {
  const EnumConverter(this.values);

  final List<T> values;

  @override
  T fromJson(String json) {
    return values.firstWhere((element) => element.name == json);
  }

  @override
  String toJson(T object) {
    return object.name;
  }
}
