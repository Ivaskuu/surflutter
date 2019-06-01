import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:surflutter/models/answer.dart';
import 'package:surflutter/models/question.dart';

class QuestionsManager {
  static QuestionsManager _instance;

  static QuestionsManager get instance {
    if (_instance == null) _instance = QuestionsManager();
    return _instance;
  }

  // These tags are for both logging and accessing Firestore's collections
  static const String TAG = 'QUESTIONS_MANAGER';
  static const String QUESTIONS_TAG = 'questions';
  static const String ANSWERS_TAG = 'answers';

  final Firestore _store = Firestore.instance;

  CollectionReference get questionsCollection =>
      _store.collection(QUESTIONS_TAG);
  CollectionReference get answersCollection => _store.collection(ANSWERS_TAG);

  Query getQuestions() => _store.collection('$QUESTIONS_TAG');

  Query getAnswers(String id) =>
      _store.collection('$QUESTIONS_TAG/$id/$ANSWERS_TAG');

  Future<Question> addQuestion(Question question) async {
    String error;

    final errorHandler = (exception, stacktrace) {
      print(
          '[$TAG] Couldn\'t add new Question, error: $exception\n$stacktrace');
      error = exception.toString();
    };

    final qRef = questionsCollection.document();
    question.id = qRef.documentID;

    await _store.runTransaction((transaction) async {
      await transaction.set(qRef, question.toMap()).catchError(errorHandler);
      print('Question added');
    }).catchError(errorHandler);

    return question;
  }

  Future<Answer> addAnswer(Answer answer) async {
    DocumentReference aRef = questionsCollection
        .document(answer.questionId)
        .collection(ANSWERS_TAG)
        .document();
    answer.id = aRef.documentID;

    aRef.setData(answer.toMap());
    return answer;
  }

  Future<void> likeQuestion(String questionId) async {
    String error;

    final errorHandler = (exception, stacktrace) {
      print(
          '[$TAG] Couldn\'t add new Question, error: $exception\n$stacktrace');
      error = exception.toString();
    };

    final qRef = questionsCollection.document(questionId);
    final qDoc = await qRef.get();

    if (qDoc.exists) {
      final question = Question.fromMap(qDoc.data);

      await _store.runTransaction((transaction) async {
        await transaction
            .set(qRef, (question..likes += 1).toMap())
            .catchError(errorHandler);
        print('Liked');
      }).catchError(errorHandler);
    }
  }
}
