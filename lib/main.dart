import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:secret_keeper/database/password_model.dart';
import 'package:secret_keeper/screens/SplashScreen.dart';

const String PasswordBoxName = "passwords";

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  Hive.registerAdapter(PasswordModelAdapter());
  Hive.openBox<PasswordModel>(PasswordBoxName);
  runApp(SecretKeeper());
}

class SecretKeeper extends StatelessWidget {
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
