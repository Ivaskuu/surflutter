class User {
  String id;

  final String name;
  final String imgUrl;
  final int xp;

  User({
    this.id,
    this.name,
    this.imgUrl,
    this.xp,
  });

  factory User.fromMap(Map data) {
    try {
      final message = User(
        id: data['id'],
        name: data['name'],
        imgUrl: data['imgUrl'],
        xp: data['xp'],
      );

      return message;
    } catch (error) {
      print('Couldn\'t build [User] object, error: $error');
      return null;
    }
  }

  Map<String, dynamic> toMap() => {
        'id': this.id,
        'name': this.name,
        'imgUrl': this.imgUrl,
        'xp': this.xp,
      };
}
