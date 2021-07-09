import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: 10,
              top: MediaQuery.of(context).size.height * 1.5 / 3,
              child: Column(
                children: [
                  Container(
                    width: 60.0,
                    height: 60.0,
                    child: InkWell(
                      onTap: () {},
                      child: Text("WHEEL"),
                    ),
                  ),
                  Container(
                    width: 60.0,
                    height: 60.0,
                    child: InkWell(
                      onTap: () {},
                      child: Text("HOT"),
                    ),
                  ),
                  Container(
                    width: 60.0,
                    height: 60.0,
                    child: InkWell(
                      onTap: () {},
                      child: Text("NEW"),
                    ),
                  )
                ],
              )),
          Positioned(
              top: MediaQuery.of(context).size.height * 1.5 / 3,
              right: 10,
              child: Column(
                children: [
                  Container(
                    width: 60.0,
                    height: 60.0,
                    child: InkWell(
                      onTap: () {},
                      child: Text("Facebook"),
                    ),
                  ),
                  Container(
                    width: 60.0,
                    height: 60.0,
                    child: InkWell(
                      onTap: () {},
                      child: Text("Rate us"),
                    ),
                  ),
                ],
              )),
          Positioned(
              top: MediaQuery.of(context).size.height / 3,
              left: MediaQuery.of(context).size.width / 2 - 90.0,
              child: Container(
                alignment: Alignment.center,
                color: Colors.red,
                child: InkWell(
                  onTap: () => Navigator.of(context).pushNamed("/game"),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 90.0, vertical: 35),
                    child: Text("PLAY!"),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
