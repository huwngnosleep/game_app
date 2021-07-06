import 'package:flutter/material.dart';
import 'package:game_app/providers/game_provider.dart';
import 'package:game_app/screens/user/home/bottom_bar.dart';
import 'package:game_app/screens/user/login/register.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => GameProvider())],
      builder: (context, chill) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomBar(),
        routes: <String, WidgetBuilder>{
          '/register': (BuildContext context) => RegisterScreen(),
          // '/b': (BuildContext context) => MyPage(title: 'page B'),
          // '/c': (BuildContext context) => MyPage(title: 'page C'),
        },
      ),
    );
  }
}
