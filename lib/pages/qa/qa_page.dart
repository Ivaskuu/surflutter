import 'package:firestore_ui/firestore_ui.dart';
import 'package:flutter/material.dart';
import 'package:surflutter/managers/questions_manager.dart';
import 'package:surflutter/models/question.dart';
import 'package:surflutter/pages/qa/question_page.dart';

class QAPage extends StatefulWidget {
  @override
  _QAPageState createState() => _QAPageState();
}

class _QAPageState extends State<QAPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).accentColor,
      child: CustomScrollView(
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
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Icon(
                    Icons.sort,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: FirestoreAnimatedList(
              shrinkWrap: true,
              query: QuestionsManager.instance.getQuestions().snapshots(),
              itemBuilder: (context, snapshot, _, i) {
                final Question question = Question.fromMap(snapshot.data);
                return QuestionTile(question: question);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class QuestionTile extends StatelessWidget {
  final Question question;
  const QuestionTile({Key key, @required this.question}) : super(key: key);

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
        child: InkWell(
          onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => QuestionPage(
                        question: question,
                      ),
                ),
              ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  question.title,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  question.description,
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
                  child: TagList(
                    title: 'StackOverflow exception',
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TagList extends StatelessWidget {
  final Color color;
  final String title;

  const TagList({
    Key key,
    this.color: Colors.green,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: List.filled(
        15,
        TagWidget(
          title: title,
          color: color,
        ),
      ),
    );
  }
}

class TagWidget extends StatelessWidget {
  final String title;
  final Color color;

  const TagWidget({
    Key key,
    @required this.title,
    this.color: Colors.green,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Material(
        borderRadius: BorderRadius.circular(32.0),
        clipBehavior: Clip.antiAlias,
        color: color,
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
