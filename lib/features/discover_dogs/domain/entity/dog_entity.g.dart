// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DogEntityAdapter extends TypeAdapter<DogEntity> {
  @override
  final int typeId = 1;

  @override
  DogEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DogEntity(
      id: fields[0] as int?,
      name: fields[1] as String?,
      breedGroup: fields[2] as String?,
      size: fields[3] as String?,
      lifespan: fields[4] as String?,
      origin: fields[5] as String?,
      temperament: fields[6] as String?,
      colors: (fields[7] as List?)?.cast<String>(),
      description: fields[8] as String?,
      image: fields[9] as String?,
      isBookmarked: fields[10] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, DogEntity obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.breedGroup)
      ..writeByte(3)
      ..write(obj.size)
      ..writeByte(4)
      ..write(obj.lifespan)
      ..writeByte(5)
      ..write(obj.origin)
      ..writeByte(6)
      ..write(obj.temperament)
      ..writeByte(7)
      ..write(obj.colors)
      ..writeByte(8)
      ..write(obj.description)
      ..writeByte(9)
      ..write(obj.image)
      ..writeByte(10)
      ..write(obj.isBookmarked);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DogEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
