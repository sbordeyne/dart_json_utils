# Dart JSON utils

Collection of utilities related to working with JsonSerializable in Dart

## Contents

- `json_serializable_chopper_converter` : library that implements a chopper `JsonConverter` to convert to and from JsonSerializable objects
- `json_serializable_converters` : library that implements converters for native dart objects, including
  * `Uint8List` / `List<int>` for bytes
  * `DateTime`
  * `Directory`
  * `Duration`
  * `Enum`
  * `File`
  * `Uri`
- `json_serializable_flutter_converters` : library that implements converters for native flutter/material objects, including
  * `Color`
  * `DateTimeRange`
  * `Size`
- `json_serializable_uuid_converter` : library to provide a converter for the `UuidValue` type from the `uuid` package.
