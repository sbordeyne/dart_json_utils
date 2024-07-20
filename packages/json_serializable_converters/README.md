`JsonSerializable` converters for core dart classes

## Features

- Full test coverage
- Easy to integrate

Supports:
- Bytes (`Uint8List`, `List<int>`), serialized in base64
- DateTime
- Directory
- File
- Duration
- Generic Enums
- Uri

All of the converters also support a `nullable()` static method to get the nullable version of that converter.

## Usage

```dart
@JsonSerializable(converters: [
  BytesConverter(),
  DateTimeConverter(),
  DurationConverter(),
  UriConverter(),
  FileConverter(),
  DirectoryConverter(),
  EnumConverter(TestEnum.values),
])
class Model {
  final DateTime dateTime;
  final Duration duration;
  final Uri uri;
  final List<int> bytes;
  final File file;
  final Directory directory;
  final TestEnum enumValue;

  Model(this.dateTime, this.duration, this.uri, this.bytes, this.file, this.directory, this.enumValue);

  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);
  Map<String, dynamic> toJson() => _$ModelToJson(this);
}
```

## Other packages

If you need ready-made `JsonSerializable` converters for other common types, take a look at these packages:

- [json_serializable_uuid_converter](https://pub.dev/packages/json_serializable_uuid_converter)
- [json_serializable_chopper_converter](https://pub.dev/packages/json_serializable_chopper_converter)
- [json_serializable_flutter_converters](https://pub.dev/packages/json_serializable_flutter_converters)
