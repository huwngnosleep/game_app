import 'package:flutter/material.dart';
import 'package:game_app/api/api_server.dart';
import 'package:game_app/model/login_model.dart';
import 'package:game_app/model/user.dart';
import 'package:game_app/providers/AuthenticationSeverice.dart';
import 'package:game_app/screens/user/home/bottom_bar.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginRequestModel requestModel;
  bool loading = false;

  User user;
  AuthenticationSeverice authenticationSeverice = AuthenticationSeverice();

  @override
  void initState() {
    super.initState();
    requestModel = new LoginRequestModel();
  }

  login() async {
    // print(requestModel.toJson());
    setState(() {
      loading = true;
    });
    APIService apiService = new APIService();
    apiService.login(requestModel).then((value) => {
          setState(() {
            loading = false;
          }),
          if (value.token.isNotEmpty)
            {
              print(value.token),
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("Login Successful!"))),
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) => BottomBar()),
                  (route) => false)
            }
          else
            {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(value.error.toString())))
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Login"), centerTitle: true),
        body: Stack(
          children: [
            WaveWidget(
              backgroundColor: Colors.white,
              config: CustomConfig(
                gradients: [
                  [Colors.red, Color(0xEEF44336)],
                  [Colors.red[800], Color(0x77E57373)],
                  [Colors.orange, Color(0x66FF9800)],
                  [Colors.white, Color(0x55FFEB3B)]
                ],
                durations: [35000, 19440, 10800, 6000],
                heightPercentages: [0.20, 0.23, 0.25, 0.30],
                blur: MaskFilter.blur(BlurStyle.solid, 10),
                gradientBegin: Alignment.bottomLeft,
                gradientEnd: Alignment.topRight,
              ),
              waveAmplitude: 1,
              backgroundImage: DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1600107363560-a2a891080c31?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=672&q=80',
                ),
                fit: BoxFit.cover,
                colorFilter:
                    ColorFilter.mode(Colors.white, BlendMode.softLight),
              ),
              size: Size(
                double.infinity,
                double.infinity,
              ),
            ),
            Column(
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
                    onChanged: (text) => requestModel.email = text,
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
                      onChanged: (text) => requestModel.password = text),
                ),
                SizedBox(height: 50.0),
                FractionallySizedBox(
                  widthFactor: 0.7,
                  child: ElevatedButton(
                      onPressed: login,
                      child: !loading
                          ? Text(
                              "Sign in",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: (requestModel.email.isNotEmpty &&
                                          requestModel.password.isNotEmpty)
                                      ? Colors.white
                                      : Colors.grey),
                            )
                          : CircularProgressIndicator(
                              color: Colors.grey,
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
            ),
          ],
        ));
  }
}
