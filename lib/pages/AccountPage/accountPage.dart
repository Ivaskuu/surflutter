import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:surflutter/models/account.dart';
import 'package:surflutter/models/app.dart';
import 'package:surflutter/pages/AccountPage/singleAppView.dart';

Account account = new Account(
  apps: [
    App(
        appName: 'Focus for Reddit',
        googlePlayurl:
            "https://play.google.com/store/apps/details?id=com.skuu.focusreddit&gl=IT",
        likesNumber: 10,
        assetPath: 'res/images/FocusForReddit.png'),
    App(
        appName: 'Room8',
        googlePlayurl:
            'https://play.google.com/store/apps/details?id=com.skuu.room8&gl=IT',
        likesNumber: 16,
        assetPath: 'res/images/Room8.png'),
    App(
        appName: 'BalzApp',
        googlePlayurl:
            'https://play.google.com/store/apps/details?id=com.leonardopizio.balzapp&gl=IT',
        likesNumber: 12,
        assetPath: 'res/images/Balzapp.png'),
  ],
  email: 'ivaskuadrain@gmail.com',
  name: 'Adrian Ivasku',
);

class AccountPage extends StatelessWidget {
  final bool
      isMyAccount; //if the account is mine, i have access to the settings button
  AccountPage(this.isMyAccount);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 256.0,
            flexibleSpace: Center(
              child: Column(
                children: <Widget>[
                  SafeArea(
                    child: Container(),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 134.0,
                        width: 134.0,
                        child: CircleAvatar(
                          backgroundColor: Colors.amberAccent,
                        ),
                      ),
                      SizedBox(
                        height: 128.0,
                        width: 128.0,
                        child: CircleAvatar(
                          backgroundColor: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    account.name,
                    style: TextStyle(fontSize: 30.0, color: Colors.white),
                  ),
                  Text(
                    account.email,
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                'Apps:',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                    margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: AppWidget(account.apps[index]),
                  ),
              childCount: account.apps.length,
            ),
          ),
        ],
      ),
    );
  }
}

class AppWidget extends StatefulWidget {
  final App app;
  AppWidget(this.app);

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => SingleAppView(widget.app))),
      child: Material(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: 'hero${widget.app.appName}',
                child: Material(
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadius.circular(8.0),
                  child: SizedBox(
                    height: 128.0,
                    width: double.infinity,
                    child: Image.asset(
                      widget.app.assetPath,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    icon: Icon(Icons.thumb_up,
                        color: liked ? Colors.blue : Colors.grey, size: 16.0),
                    onPressed: () {
                      setState(() {
                        if (!liked) widget.app.likesNumber++;
                        liked = !liked;
                      });
                    },
                  ),
                  Text('${widget.app.likesNumber}',
                      style: TextStyle(color: Colors.grey)),
                  SizedBox(
                    height: 24.0,
                    width: 64.0,
                  ),
                  Text(widget.app.appName),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
