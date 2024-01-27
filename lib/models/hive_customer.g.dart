// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_customer.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveCustomerAdapter extends TypeAdapter<HiveCustomer> {
  @override
  final int typeId = 0;

  @override
  HiveCustomer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveCustomer(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveCustomer obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.username)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.phoneNumber)
      ..writeByte(4)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveCustomerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
