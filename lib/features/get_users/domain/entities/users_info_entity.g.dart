// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_info_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UsersEntityAdapter extends TypeAdapter<UsersEntity> {
  @override
  final int typeId = 5;

  @override
  UsersEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UsersEntity(
      id: fields[0] as int,
      name: fields[1] as String,
      userName: fields[2] as String,
      phone: fields[4] as String,
      email: fields[3] as String,
      address: fields[5] as AddressEntity,
      website: fields[6] as String,
      company: fields[7] as CompanyEntity,
    );
  }

  @override
  void write(BinaryWriter writer, UsersEntity obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.userName)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.phone)
      ..writeByte(5)
      ..write(obj.address)
      ..writeByte(6)
      ..write(obj.website)
      ..writeByte(7)
      ..write(obj.company);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsersEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
