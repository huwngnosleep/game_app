import 'package:flutter/material.dart';
import 'package:game_app/screens/user/home/profile.dart';
import 'package:game_app/screens/user/login/register.dart';

import 'screens/user/login/login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfileScreen(),
    routes: <String, WidgetBuilder>{
        '/register': (BuildContext context) => RegisterScreen(),
        // '/b': (BuildContext context) => MyPage(title: 'page B'),
        // '/c': (BuildContext context) => MyPage(title: 'page C'),
      },
  ));
}
