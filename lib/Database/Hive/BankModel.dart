import 'package:hive/hive.dart';

part 'BankModel.g.dart';

@HiveType(typeId: 2)
class BankModel{
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String bankName;
  @HiveField(2)
  final String accountNumber;
  @HiveField(3)
  final String accountType;
  @HiveField(4)
  final String ifsc;
  @HiveField(5)
  final String branchName;
  @HiveField(6)
  final String branchAddress;
  @HiveField(7)
  final String bankNumber;
  @HiveField(8)
  final String note;

  BankModel({this.title, this.bankName, this.accountNumber, this.accountType, this.ifsc, this.branchName, this.branchAddress, this.bankNumber, this.note});
}