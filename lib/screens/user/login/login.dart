import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 100),
        FractionallySizedBox(
          widthFactor: 0.7,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Email",
            ),
            onChanged: (text) => _setEmail(text),
          ),
        ),
        SizedBox(height: 20.0),
        FractionallySizedBox(
          widthFactor: 0.7,
          child: TextField(
            keyboardType: TextInputType.visiblePassword,
            //hidden password
            obscureText: true,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: "Password"),
            onChanged: (text) => _setPass(text),
          ),
        ),
        SizedBox(height: 50.0),
        FractionallySizedBox(
          widthFactor: 0.7,
          child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "Sign in",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: (email.isNotEmpty && password.isNotEmpty)
                        ? Colors.white
                        : Colors.grey),
              )),
        ),
        SizedBox(height: 40.0),
        InkWell(
          child: Text(
            "Forgot your password?",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.blue, fontSize: 12.0),
          ),
          onTap: () => Navigator.of(context).pushNamed("/register"),
        ),
        SizedBox(height: 20.0),
        InkWell(
          child: Text(
            "Don't have account? Create one",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.blue, fontSize: 14.0),
          ),
          onTap: () => Navigator.of(context).pushNamed("/register"),
        ),
      ],
    ));
  }

  _setEmail(String text) {
    setState(() {
      email = text;
    });
  }

  _setPass(String text) {
    setState(() {
      password = text;
    });
  }
}
