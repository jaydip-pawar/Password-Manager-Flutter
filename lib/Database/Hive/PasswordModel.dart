import 'package:hive/hive.dart';

part 'PasswordModel.g.dart';

@HiveType(typeId: 0)
class PasswordModel {
  @HiveField(0)
  final String websiteName;
  @HiveField(1)
  final String websiteAddress;
  @HiveField(2)
  final String userName;
  @HiveField(3)
  final String password;
  @HiveField(4)
  final String notes;

  PasswordModel(
      {this.websiteName, this.websiteAddress, this.userName, this.password, this.notes});
}