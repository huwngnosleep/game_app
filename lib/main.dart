import 'package:flutter/material.dart';
import 'package:game_app/providers/AuthenticationSeverice.dart';
import 'package:game_app/providers/game_provider.dart';
import 'package:game_app/screens/user/home/game.dart';
import 'package:game_app/screens/user/home/home.dart';
import 'package:game_app/screens/user/login/main_screen.dart';
import 'package:game_app/screens/user/login/register.dart';
import 'package:provider/provider.dart';
import 'screens/user/login/login.dart';

Future<void> main() async {
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
      providers: [
        ChangeNotifierProvider(create: (_) => GameProvider()),
        ChangeNotifierProvider(create: (_) => AuthenticationSeverice()),
      ],
      builder: (context, chill) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        routes: <String, WidgetBuilder>{
          '/register': (BuildContext context) => RegisterScreen(),
          '/login': (BuildContext context) => LoginScreen(),
          '/game': (BuildContext context) => GameScreen(),
        },
      ),
    );
  }
}
