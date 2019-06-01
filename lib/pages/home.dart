import 'package:flutter/material.dart';
import 'package:surflutter/pages/qa/qa_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SurFlutter'),
      ),
      body: QAPage(),
    );
  }
}
