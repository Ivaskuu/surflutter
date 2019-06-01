import 'package:flutter/material.dart';

final code = '''Padding(
  padding: const EdgeInsets.all(16.0),
  child: Material(
    color: Colors.white,
    elevation: 6.0,
    shadowColor: Colors.black45,
    borderRadius: BorderRadius.circular(4.0),
    clipBehavior: Clip.antiAlias,
    child: ListTile(
      title: TextField(
        decoration: InputDecoration.collapsed(
          hintText: 'Search for a question...',
        ),
      ),
      trailing: Icon(Icons.search),
    ),
  ),
),
''';

class WidgetsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).accentColor,
      child: ListView(
        children: <Widget>[
          WidgetTile(),
        ],
      ),
    );
  }
}

class WidgetTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => Navigator.push(
            context, new MaterialPageRoute(builder: (context) => WidgetCode())),
        child: Material(
          elevation: 6.0,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(4.0),
          color: Colors.white,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Material(
                  color: Theme.of(context).accentColor,
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadius.circular(4.0),
                  child: SizedBox(
                    height: 128.0,
                    width: double.infinity,
                    child: Image.asset(
                      'res/images/search.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Row(
                  children: <Widget>[
                    IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      icon: Icon(
                        Icons.thumb_up,
                        color: Colors.grey,
                        size: 16.0,
                      ),
                      onPressed: () {},
                    ),
                    Text(
                      '387',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 24.0,
                      width: 64.0,
                    ),
                    Text(
                      'Search material TextField',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WidgetCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox.expand(
          child: Text(
            code,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
