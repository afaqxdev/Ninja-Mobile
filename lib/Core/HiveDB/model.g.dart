// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModelHiveAdapter extends TypeAdapter<ModelHive> {
  @override
  final int typeId = 0;

  @override
  ModelHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ModelHive(
      id: fields[0] as String,
      name: fields[1] as String,
      price: fields[2] as String,
      quantity: fields[4] as int,
      totalprice: fields[3] as String,
      images: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ModelHive obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.totalprice)
      ..writeByte(4)
      ..write(obj.quantity)
      ..writeByte(5)
      ..write(obj.images);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
