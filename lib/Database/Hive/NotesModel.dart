import 'package:hive/hive.dart';

part 'NotesModel.g.dart';

@HiveType(typeId: 3)
class NotesModel{
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String note;

  NotesModel({this.title, this.note});
}