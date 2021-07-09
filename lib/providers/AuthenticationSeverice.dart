import 'package:flutter/foundation.dart';
import 'package:game_app/model/user.dart';

class AuthenticationSeverice with ChangeNotifier {
  User _user;

  User get getUser => _user;

  set setUser(User user) {
    _user = user;
  }
}
