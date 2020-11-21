import 'package:flutter/material.dart';
import 'package:secret_keeper/screens/SplashScreen.dart';

void main(){
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
