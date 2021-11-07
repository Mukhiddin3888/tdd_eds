// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CompanyEntityAdapter extends TypeAdapter<CompanyEntity> {
  @override
  final int typeId = 4;

  @override
  CompanyEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CompanyEntity(
      name: fields[0] as String,
      bs: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CompanyEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.bs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompanyEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
