import 'package:flutter/material.dart';
import 'package:game_app/providers/AuthenticationSeverice.dart';
import 'package:game_app/providers/game_provider.dart';
import 'package:game_app/screens/game/snake/snake_screen.dart';
import 'package:game_app/screens/game/taptheblack/game_screen.dart';
import 'package:game_app/screens/user/home/game.dart';
import 'package:game_app/screens/user/home/home.dart';
import 'package:game_app/screens/user/home/profile.dart';
import 'package:game_app/screens/user/home/wheel.dart';
import 'package:game_app/screens/user/login/main_screen.dart';
import 'package:game_app/screens/user/login/register.dart';
import 'package:provider/provider.dart';
import 'screens/game/snake/home.dart';
import 'screens/game/taptheblack/game_result_screen.dart';
import 'screens/user/home/chart.dart';
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
          '/wheel': (BuildContext context) => WheelScreen(),
          '/user': (BuildContext context) => ProfileScreen(),
          '/chart': (BuildContext context) => ChartScreen(),
          '/snake': (BuildContext context) => HomeSnake(),
          '/playsnake': (BuildContext context) => SnakeGame(),
          '/taptheblack': (BuildContext context) => TapTheBlackScreen(),
          '/tapresult': (BuildContext context) => TapResult()
        },
      ),
    );
  }
}
