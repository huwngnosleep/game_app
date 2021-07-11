import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScoreChart extends StatefulWidget {
  final int score;

  ScoreChart(this.score);

  @override
  _ScoreChartState createState() => _ScoreChartState();
}

class _ScoreChartState extends State<ScoreChart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Score: ${widget.score}',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'High score: 656',
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
