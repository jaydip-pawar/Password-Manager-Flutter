// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BankModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BankModelAdapter extends TypeAdapter<BankModel> {
  @override
  final int typeId = 2;

  @override
  BankModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BankModel(
      title: fields[0] as String,
      bankName: fields[1] as String,
      accountNumber: fields[2] as String,
      accountType: fields[3] as String,
      ifsc: fields[4] as String,
      branchName: fields[5] as String,
      branchAddress: fields[6] as String,
      bankNumber: fields[7] as String,
      note: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BankModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.bankName)
      ..writeByte(2)
      ..write(obj.accountNumber)
      ..writeByte(3)
      ..write(obj.accountType)
      ..writeByte(4)
      ..write(obj.ifsc)
      ..writeByte(5)
      ..write(obj.branchName)
      ..writeByte(6)
      ..write(obj.branchAddress)
      ..writeByte(7)
      ..write(obj.bankNumber)
      ..writeByte(8)
      ..write(obj.note);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BankModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
