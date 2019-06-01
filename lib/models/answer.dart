class Answer {
  String id;
  String parentId;
  String questionId;

  final String text;
  final String byId;
  final int likes;

  final DateTime time;

  Answer({
    this.id,
    this.parentId,
    this.text,
    this.byId,
    this.questionId,
    this.time,
    this.likes,
  });

  factory Answer.fromMap(Map data) {
    try {
      final message = Answer(
        id: data['id'],
        parentId: data['parentId'],
        text: data['text'],
        byId: data['byId'],
        questionId: data['questionId'],
        time: data['time'] != null ? data['time'].toDate() : null,
        likes: data['likes'],
      );

      return message;
    } catch (error) {
      print('Couldn\'t build [Question] object, error: $error');
      return null;
    }
  }

  Map<String, dynamic> toMap() => {
        'id': this.id,
        'parentId': this.parentId,
        'text': this.text,
        'byId': this.byId,
        'questionId': this.questionId,
        'time': this.time,
        'likes': this.likes,
      };
}
