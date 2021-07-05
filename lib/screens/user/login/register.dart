import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _controller;
  String email = "";
  String password = "";
  String name = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FractionallySizedBox(
            widthFactor: 0.7,
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: "Email"),
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
              decoration: InputDecoration(labelText: "Password"),
              onChanged: (text) => _setPass(text),
            ),
          ),
          SizedBox(height: 20.0),
          FractionallySizedBox(
            widthFactor: 0.7,
            child: TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(labelText: "Name"),
              onChanged: (text) => _setName(text),
            ),
          ),
          SizedBox(height: 50.0),
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 45.0,
            child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Sign up",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: (email.isNotEmpty &&
                              password.isNotEmpty &&
                              name.isNotEmpty)
                          ? Colors.white
                          : Colors.grey),
                )),
          ),
          SizedBox(height: 30.0),
          InkWell(
              child: Text(
                "Already have an account? Sign in",
                style: TextStyle(color: Colors.blue, fontSize: 12.0),
              ),
              onTap: () => Navigator.of(context).pop())
        ],
      ),
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

  _setName(String text) {
    setState(() {
      name = text;
    });
  }
}
