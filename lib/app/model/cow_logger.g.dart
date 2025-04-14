// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cow_logger.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CowAdapter extends TypeAdapter<Cow> {
  @override
  final int typeId = 5;

  @override
  Cow read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Cow(
      id: fields[0] as int,
      name: fields[1] as String,
      description: fields[2] as String,
      images: (fields[3] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Cow obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.images);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CowAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
