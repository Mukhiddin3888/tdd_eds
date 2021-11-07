// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddressEntityAdapter extends TypeAdapter<AddressEntity> {
  @override
  final int typeId = 3;

  @override
  AddressEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddressEntity(
      street: fields[0] as String,
      suite: fields[1] as String,
      city: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AddressEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.street)
      ..writeByte(1)
      ..write(obj.suite)
      ..writeByte(2)
      ..write(obj.city);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
