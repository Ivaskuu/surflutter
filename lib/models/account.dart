import 'package:surflutter/models/app.dart';

class Account {
  String name;
  String email;
  List<App> apps;
  
  Account({
    this.apps,
    this.email,
    this.name,
  });
}
