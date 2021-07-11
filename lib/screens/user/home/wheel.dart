import 'dart:async';
import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:game_app/components/alert.dart';

class WheelScreen extends StatefulWidget {
  @override
  _WheelScreenState createState() => _WheelScreenState();
}

class _WheelScreenState extends State<WheelScreen> {
  StreamController<int> selected = StreamController<int>.broadcast();
  ConfettiController _controllerCenter;
  ConfettiController _controllerCenterRight;
  ConfettiController _controllerCenterLeft;
  @override
  void initState() {
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 2));
    _controllerCenterRight =
        ConfettiController(duration: const Duration(seconds: 2));
    _controllerCenterLeft =
        ConfettiController(duration: const Duration(seconds: 2));

    super.initState();
  }

  @override
  void dispose() {
    selected.close();
    _controllerCenter.dispose();
    _controllerCenterRight.dispose();
    _controllerCenterLeft.dispose();
    super.dispose();
  }

  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  Alert alert = Alert();

  @override
  Widget build(BuildContext context) {
    final items = <String>[
      '300\$',
      '200\$',
      '100\$',
      '1000\$',
      'Null',
      '500\$',
      '5000\$',
      '10000\$',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Goodluck To You'),
        centerTitle: true,
        backgroundColor: Colors.deepOrange[100],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: FortuneWheel(
                  animateFirst: true,
                  selected: selected.stream,
                  onAnimationEnd: () {
                    selected.stream.asBroadcastStream().listen((value) {
                      if (value != 4) {
                        alert.alert("Congratulation!",
                            "You won ${items[value]}", context);
                        _controllerCenter.play();
                        _controllerCenterRight.play();
                        _controllerCenterLeft.play();
                      } else
                        alert.alert("Better next!",
                            "Good luck to you in next time!", context);
                    });
                  },
                  items: [
                    for (int i = 0; i < items.length; i++)
                      FortuneItem(
                          style: FortuneItemStyle(
                              borderWidth: 0,
                              color: i % 2 == 0
                                  ? Color(0xFFf6a745)
                                  : Color(0xFFf5514a)),
                          child: Text(
                            items[i],
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 32.0),
                          )),
                  ],
                ),
              ),
              TextButton(
                  onPressed: () => setState(() {
                        selected.add(
                          Fortune.randomInt(0, items.length),
                        );
                      }),
                  child: Text("START"))
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: ConfettiWidget(
              confettiController: _controllerCenter,
              blastDirectionality: BlastDirectionality
                  .explosive, // don't specify a direction, blast randomly
              shouldLoop:
                  false, // start again as soon as the animation is finished
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple
              ], // manually specify the colors to be used
              createParticlePath: drawStar, // define a custom shape/path.
            ),
          ),

          //CENTER RIGHT -- Emit left
          Align(
            alignment: Alignment.centerRight,
            child: ConfettiWidget(
              confettiController: _controllerCenterRight,
              blastDirection: pi, // radial value - LEFT
              particleDrag: 0.05, // apply drag to the confetti
              emissionFrequency: 0.05, // how often it should emit
              numberOfParticles: 20, // number of particles to emit
              gravity: 0.05, // gravity - or fall speed
              shouldLoop: false,
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink
              ], // manually specify the colors to be used
            ),
          ),

          //CENTER LEFT - Emit right
          Align(
            alignment: Alignment.centerLeft,
            child: ConfettiWidget(
              confettiController: _controllerCenterLeft,
              blastDirection: 0, // radial value - RIGHT
              emissionFrequency: 0.6,
              minimumSize: const Size(10,
                  10), // set the minimum potential size for the confetti (width, height)
              maximumSize: const Size(50,
                  50), // set the maximum potential size for the confetti (width, height)
              numberOfParticles: 1,
              gravity: 0.1,
            ),
          ),
        ],
      ),
    );
  }
}
