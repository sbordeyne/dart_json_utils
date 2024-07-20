Converter for the [`chopper`](https://pub.dev/packages/chopper) library using `JsonSerializable` models.

## Features

- Full test coverage
- Easily integrates into chopper
- Supports generic responses

## Usage

```dart
final client = ChopperClient(
    services: [
        _$ApiService(),
    ],
    converter: JsonSerializableConverter({
        PostResource: PostResource.fromJson,
    }),
);
```

## Other packages

If you need ready-made `JsonSerializable` converters for other common types, take a look at these packages:

- [json_serializable_uuid_converter](https://pub.dev/packages/json_serializable_uuid_converter)
- [json_serializable_converters](https://pub.dev/packages/json_serializable_converters)
- [json_serializable_flutter_converters](https://pub.dev/packages/json_serializable_flutter_converters)
