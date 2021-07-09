import 'package:flutter/material.dart';
import 'package:game_app/providers/game_provider.dart';
import 'package:game_app/screens/user/home/bottom_bar.dart';
import 'package:game_app/screens/user/login/main_screen.dart';
import 'package:game_app/screens/user/login/register.dart';
import 'package:provider/provider.dart';
import 'screens/user/login/login.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
      ],
      builder: (context, chill) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
        routes: <String, WidgetBuilder>{
          '/register': (BuildContext context) => RegisterScreen(),
          '/login': (BuildContext context) => LoginScreen(),
          // '/c': (BuildContext context) => MyPage(title: 'page C'),
        },
      ),
    );
  }
}
