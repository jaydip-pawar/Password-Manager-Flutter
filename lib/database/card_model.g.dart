// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CardModelAdapter extends TypeAdapter<CardModel> {
  @override
  final int typeId = 1;

  @override
  CardModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CardModel(
      cardName: fields[0] as String,
      cardNumber: fields[1] as String,
      userName: fields[2] as String,
      expiration: fields[3] as String,
      cvv: fields[4] as String,
      pin: fields[5] as String,
      note: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CardModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.cardName)
      ..writeByte(1)
      ..write(obj.cardNumber)
      ..writeByte(2)
      ..write(obj.userName)
      ..writeByte(3)
      ..write(obj.expiration)
      ..writeByte(4)
      ..write(obj.cvv)
      ..writeByte(5)
      ..write(obj.pin)
      ..writeByte(6)
      ..write(obj.note);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CardModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
