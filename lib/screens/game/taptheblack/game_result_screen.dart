import 'package:flutter/material.dart';
import 'package:game_app/components/taptheblack/custom_button.dart';

class TapResult extends StatefulWidget {
  @override
  _TapResultState createState() => _TapResultState();
}

class _TapResultState extends State<TapResult> {
  var _authFormVisible = false;
  final int animationDuration = 500;

  @override
  Widget build(BuildContext context) {
    void replayButtonHandler() {
      Navigator.of(context).pushNamed("/taptheblack");
    }

    void backHomeButtonHandler() {
      Navigator.of(context).popUntil(ModalRoute.withName('/game'));
    }

    void uploadScoreHandler() {
      setState(() {
        _authFormVisible = !_authFormVisible;
      });
    }

    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, int>;
    final score = routeArgs['score'];
    final size = routeArgs['size'];

    return Scaffold(
      body: Center(
        child: Card(
          elevation: 10,
          child: AnimatedContainer(
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(milliseconds: animationDuration),
              decoration:
                  BoxDecoration(color: Theme.of(context).backgroundColor),
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.width *
                      (_authFormVisible == false ? 0.6 : 0.9),
                  maxWidth: MediaQuery.of(context).size.width * 0.7),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Your Score: $score',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    'Mode: ${size}x${size}',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    'Try again?',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CustomButton(
                          onPress: () => replayButtonHandler(),
                          icon: Icon(Icons.cached)),
                      CustomButton(
                          onPress: () => backHomeButtonHandler(),
                          icon: Icon(Icons.home)),
                      CustomButton(
                          onPress: () => uploadScoreHandler(),
                          icon: Icon(Icons.cloud_upload)),
                    ],
                  ),
                  if (_authFormVisible)
                    AnimatedOpacity(
                        opacity: _authFormVisible ? 1 : 0,
                        duration: Duration(milliseconds: animationDuration),
                        child: null
                        // Center(child: AuthForm(score: score, size: size))
                        ),
                ],
              )),
        ),
      ),
    );
  }
}
