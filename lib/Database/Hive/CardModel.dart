import 'package:hive/hive.dart';

part 'CardModel.g.dart';

@HiveType(typeId: 1)
class CardModel{
  @HiveField(0)
  final String cardName;
  @HiveField(1)
  final String cardNumber;
  @HiveField(2)
  final String userName;
  @HiveField(3)
  final String expiration;
  @HiveField(4)
  final String cvv;
  @HiveField(5)
  final String pin;
  @HiveField(6)
  final String note;

  CardModel({this.cardName, this.cardNumber, this.userName, this.expiration, this.cvv, this.pin, this.note});

}