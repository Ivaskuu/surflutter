import 'package:flutter/material.dart';
import 'package:surflutter/models/app.dart';
import 'package:url_launcher/url_launcher.dart';

class SingleAppView extends StatelessWidget {
  final App app;
  SingleAppView(this.app);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(app.appName),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
        child: Column(
          children: <Widget>[
            Hero(
              tag: 'hero${app.appName}',
              child: SizedBox(
                height: 256.0,
                width: double.infinity,
                child: Image.asset(
                  app.assetPath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'This app has ${app.likesNumber} likes',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                app.googlePlayurl != null
                    ? OutlineButton(
                        child: Text('GOOGLE PLAY'),
                        onPressed: () => _launchURL(app.googlePlayurl))
                    : Container(),
                app.appStoreurl != null
                    ? OutlineButton(
                        child: Text('APP STORE'),
                        onPressed: () => _launchURL(app.appStoreurl))
                    : Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'could not launch $url';
    }
  }
}
