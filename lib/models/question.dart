class Question {
  String id;

  final String title;
  final String description;
  final String byId;
  final String answerId;

  final List<String> tags;

  final DateTime time;
  int likes;

  Question({
    this.id,
    this.title,
    this.description,
    this.byId,
    this.answerId,
    this.tags,
    this.time,
    this.likes,
  });

  factory Question.fromMap(Map data) {
    try {
      final message = Question(
        id: data['id'],
        title: data['title'],
        description: data['description'],
        byId: data['byId'],
        answerId: data['answerId'],
        tags: data['tags'],
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
        'title': this.title,
        'description': this.description,
        'byId': this.byId,
        'answerId': this.answerId,
        'tags': this.tags,
        'time': this.time,
        'likes': this.likes,
      };
}
