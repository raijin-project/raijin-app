import 'package:flutter/foundation.dart';
import 'package:raijin/main.dart';

class AppModel extends ChangeNotifier {
  bool loggedIn = false;
  User user;

  void login(Map<String, dynamic> data) {
    loggedIn = true;
    user = User.fromJson(data);
  }

  void logout() {
    loggedIn = false;
    user = null;
  }
}

class User {
  String id;
  String userName;
  String email;

  User(this.id, this.userName, this.email);

  User.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    userName = data['user_name'];
    email = data['email'];
  }
}