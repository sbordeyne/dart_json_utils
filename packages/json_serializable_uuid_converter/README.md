A `JsonConverter` to serialize and deserialize `UuidValue` objects.

## Features

- Easy to use, just add `UuidValueConverter()` in your `@JsonSerializable(converters: [])` annotation
- Minimal dependencies: compatible with every version of `package:uuid/uuid.dart` from v4 onwards.
- Full test coverage

## Getting started

Install the library from `pub.dev`

```bash
$ flutter pub add json_serializable_uuid_converter
```

## Usage

```dart
import 'package:json_serializable_uuid_converter/json_serializable_uuid_converter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

@JsonSerializable(converters: [UuidValueConverter(validate: true), UuidValueConverter.nullable(validate: false)])
class MyModel {
    final UuidValue requiredId;
    final UuidValue? optionalId;

    const MyModel({
        required this.requiredId,
        this.optionalId,
    });

    factory MyModel.fromJson(Map<String, dynamic> json) => _$MyModelFromJson(json);
    Map<String, dynamic> toJson() => _$MyModelToJson(this);
}
```

## Other packages

If you need ready-made `JsonSerializable` converters for other common types, take a look at these packages:

- [json_serializable_chopper_converter](https://pub.dev/packages/json_serializable_chopper_converter)
- [json_serializable_converters](https://pub.dev/packages/json_serializable_converters)
- [json_serializable_flutter_converters](https://pub.dev/packages/json_serializable_flutter_converters)
