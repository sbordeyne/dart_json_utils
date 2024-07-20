`JsonSerializable` converters to convert `flutter` types to and from JSON

## Features

- Full test coverage
- Ready-made converters for flutter types

Supports:

- `Color`
- `DateTimeRange`
- `Size`

## Usage

```dart
@JsonSerializable(converters: [
  SizeConverter(),
  DateTimeRangeConverter(),
  ColorConverter(),
])
class Model {
  final Color color;
  final DateTimeRange dateTimeRange;
  final Size size;

  Model({
    required this.color,
    required this.dateTimeRange,
    required this.size,
  });

  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);
  Map<String, dynamic> toJson() => _$ModelToJson(this);
}
```

## Other packages

If you need ready-made `JsonSerializable` converters for other common types, take a look at these packages:

- [json_serializable_uuid_converter](https://pub.dev/packages/json_serializable_uuid_converter)
- [json_serializable_converters](https://pub.dev/packages/json_serializable_converters)
- [json_serializable_chopper_converter](https://pub.dev/packages/json_serializable_chopper_converter)
