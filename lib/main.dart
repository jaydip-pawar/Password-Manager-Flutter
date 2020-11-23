import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:secret_keeper/screens/SplashScreen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:secret_keeper/Database/Hive/BankModel.dart';
import 'package:secret_keeper/Database/Hive/CardModel.dart';
import 'package:secret_keeper/Database/Hive/NotesModel.dart';
import 'package:secret_keeper/Database/Hive/PasswordModel.dart';

void main(){
  runApp(SecretKeeper());
}

class SecretKeeper extends StatefulWidget {
  @override
  _SecretKeeperState createState() => _SecretKeeperState();
}

class _SecretKeeperState extends State<SecretKeeper> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Hive.registerAdapter(PasswordModelAdapter());
    Hive.registerAdapter(CardModelAdapter());
    Hive.registerAdapter(BankModelAdapter());
    Hive.registerAdapter(NotesModelAdapter());
    _openBox();
  }

  Future _openBox() async {
    WidgetsFlutterBinding.ensureInitialized();
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    Box passwordBox = await Hive.openBox<PasswordModel>('passwordBox');
    Box cardBox = await Hive.openBox<CardModel>('cardBox');
    Box bankBox = await Hive.openBox<BankModel>('bankBox');
    Box notesBox = await Hive.openBox<NotesModel>('notesBox');
    return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Secret Keeper",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Colors.white60,
        primaryColor: Colors.white,
        primaryIconTheme: IconThemeData(color: Colors.black),
        fontFamily: "GoogleFonts",
      ),
      home: SplashScreen(),
    );
  }
}
