// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PasswordModelAdapter extends TypeAdapter<PasswordModel> {
  @override
  final int typeId = 0;

  @override
  PasswordModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PasswordModel(
      websiteName: fields[0] as String,
      websiteAddress: fields[1] as String,
      userName: fields[2] as String,
      password: fields[3] as String,
      notes: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PasswordModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.websiteName)
      ..writeByte(1)
      ..write(obj.websiteAddress)
      ..writeByte(2)
      ..write(obj.userName)
      ..writeByte(3)
      ..write(obj.password)
      ..writeByte(4)
      ..write(obj.notes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PasswordModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
