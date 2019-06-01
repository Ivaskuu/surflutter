import 'package:firestore_ui/animated_firestore_list.dart';
import 'package:flutter/material.dart';
import 'package:surflutter/managers/questions_manager.dart';
import 'package:surflutter/models/answer.dart';
import 'package:surflutter/models/question.dart';
import 'package:surflutter/pages/qa/qa_page.dart';

class QuestionPage extends StatefulWidget {
  final Question question;
  const QuestionPage({Key key, @required this.question}) : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(32.0).copyWith(top: 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
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
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                SizedBox(
                  height: 32.0,
                  child: TagList(
                    color: Colors.white10,
                    title: 'build.gradle',
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  widget.question.title,
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  widget.question.description.replaceAll('\\n', '\n'),
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Material(
                      borderRadius: BorderRadius.circular(4.0),
                      clipBehavior: Clip.antiAlias,
                      color: Colors.white10,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(
                              widget.question.answerId != null &&
                                      widget.question.answerId.trim() != ''
                                  ? Icons.done
                                  : Icons.close,
                              color: Colors.white,
                              size: 20.0,
                            ),
                            SizedBox(width: 8.0),
                            Text(
                              widget.question.answerId != null &&
                                      widget.question.answerId.trim() != ''
                                  ? 'Answered'
                                  : 'Not answered',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.thumb_up,
                          color: Colors.white,
                          size: 16.0,
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          '371',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          AddAnswerTile(questionId: widget.question.id),
          Divider(),
          // AnswerTile(),
          FirestoreAnimatedList(
            shrinkWrap: true,
            query: QuestionsManager.instance
                .getAnswers(widget.question.id)
                .snapshots(),
            itemBuilder: (context, snapshot, _, i) {
              final Answer answer = Answer.fromMap(snapshot.data);
              return AnswerTile(answer: answer);
            },
          ),
        ],
      ),
    );
  }
}

class AnswerTile extends StatelessWidget {
  final Answer answer;
  const AnswerTile({Key key, @required this.answer}) : super(key: key);

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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
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
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                answer
                    .text, // 'Could you please post your code so we can help you?',
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16.0,
                  // fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.thumb_up,
                            color: Colors.black26,
                            size: 16.0,
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            (answer.likes ?? 0).toString(),
                            style: TextStyle(
                              color: Colors.black38,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 16.0),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.comment,
                            color: Colors.black26,
                            size: 16.0,
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            '1',
                            style: TextStyle(
                              color: Colors.black38,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ), /* Row(
                        children: <Widget>[
                          Icon(
                            Icons.,
                            color: Colors.black26,
                            size: 16.0,
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            '371',
                            style: TextStyle(
                              color: Colors.black38,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ), */
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.reply,
                        color: Colors.black26,
                        size: 16.0,
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        'Reply',
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(),
              CommentTile(),
            ],
          ),
        ),
      ),
    );
  }
}

class CommentTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0).copyWith(right: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
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
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Text(
            'Yeah, he is right, please publish your code',
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 16.0,
              // fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          Row(
            children: <Widget>[
              Icon(
                Icons.thumb_up,
                color: Colors.black26,
                size: 16.0,
              ),
              SizedBox(width: 8.0),
              Text(
                '3',
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AddAnswerTile extends StatefulWidget {
  final String questionId;
  const AddAnswerTile({Key key, @required this.questionId}) : super(key: key);

  @override
  _AddAnswerTileState createState() => _AddAnswerTileState();
}

class _AddAnswerTileState extends State<AddAnswerTile> {
  TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

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
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
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
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: controller,
                      maxLines: null,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Add your answer',
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (controller.text.trim().length > 0) {
                        print('sending answer');

                        Answer answer = Answer(
                          questionId: widget.questionId,
                          byId: '12345',
                          likes: 0,
                          text: controller.text,
                          time: DateTime.now(),
                        );

                        QuestionsManager.instance.addAnswer(answer);
                      }
                    },
                    icon: Icon(
                      Icons.send,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
