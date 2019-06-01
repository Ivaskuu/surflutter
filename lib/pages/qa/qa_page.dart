import 'package:flutter/material.dart';

class QAPage extends StatefulWidget {
  @override
  _QAPageState createState() => _QAPageState();
}

class _QAPageState extends State<QAPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Padding(
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
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  'New questions',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8.0),
                Icon(Icons.sort),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            QuestionTile(),
            QuestionTile(),
            QuestionTile(),
            QuestionTile(),
            QuestionTile(),
          ]),
        ),
      ],
    );
  }
}

class QuestionTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Material(
        color: Colors.white,
        elevation: 6.0,
        shadowColor: Colors.black45,
        borderRadius: BorderRadius.circular(4.0),
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'StackOverflow exception',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'I was trying to do an app for the Flutter hackathon but it gives me an error when I try to create a stateful widget. Can you please help me?',
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16.0,
                  // fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Divider(),
              SizedBox(height: 8.0),
              Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 8.0,
                    backgroundColor: Colors.red,
                    child: Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 12.0,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    'Pizio Leonardo',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              // SizedBox(height: 8.0),
              SizedBox(
                height: 32.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.filled(
                    15,
                    TagWidget(
                      title: 'StackOverflow exception',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TagWidget extends StatelessWidget {
  final String title;
  const TagWidget({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Material(
        borderRadius: BorderRadius.circular(32.0),
        clipBehavior: Clip.antiAlias,
        color: Colors.green,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
