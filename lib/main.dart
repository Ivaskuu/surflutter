import 'package:flutter/material.dart';
import 'package:surflutter/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SurFlutter',
      theme: ThemeData(
        accentColor: Color(0xFF0178FF),
        primaryColor: Color(0xFF0178FF),
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'GoogleSans',
      ),
      home: HomePage(),
    );
  }
}
