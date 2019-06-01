import 'package:flutter/material.dart';
import 'package:surflutter/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SurFlutter',
      theme: ThemeData(
        accentColor: Color(0xFF661DE9),
        primaryColor: Color(0xFF661DE9),
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'GoogleSans',
      ),
      home: HomePage(),
    );
  }
}
