import 'package:flutter/material.dart';
import 'package:surflutter/pages/AccountPage/accountPage.dart';
import 'package:surflutter/pages/bottom_navbar.dart';
import 'package:surflutter/pages/jobs/jobs_page.dart';
import 'package:surflutter/pages/qa/qa_page.dart';
import 'package:surflutter/pages/widgets/widgets_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pages = [
    QAPage(),
    WidgetsPage(),
    JobsPage(),
    AccountPage(true),
  ];

  int _page = 0;

  _changePage(int i) => setState(() => _page = i);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _page == 0
              ? 'Questions and answers'
              : _page == 1
                  ? 'Widgets library'
                  : _page == 2 ? 'Find jobs' : 'My account',
          style: TextStyle(
              // color: Colors.black,
              ),
        ),
        // backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: _pages[_page],
      bottomNavigationBar: BottomNavbar(
        actualItem: _page,
        onActualItemChanged: _changePage,
      ),
    );
  }
}
