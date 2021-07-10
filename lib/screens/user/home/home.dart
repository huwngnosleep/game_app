import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF3a3c83), Color(0xFF4e52c3)])),
          ),
          Positioned(
              left: 10,
              top: MediaQuery.of(context).size.height * 1.5 / 3,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Badge(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0))),
                        width: 70,
                        height: 70,
                        child: Image.asset(
                          "assets/images/wheel.png",
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      badgeContent: Text("1",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      badgeColor: Color(0xFFd40d0d),
                      animationType: BadgeAnimationType.slide,
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {},
                    child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.redAccent, Colors.red.shade900],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                        ),
                        width: 60.0,
                        height: 40.0,
                        child: Text("HOT",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold))),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {},
                    child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Color(0xFF08a21c), Color(0xFF056d12)],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter),
                            border: Border(
                                bottom: BorderSide(
                                    width: 2.0, color: Colors.green.shade900),
                                right: BorderSide(
                                    width: 2.0, color: Colors.green.shade900))),
                        width: 60.0,
                        height: 40.0,
                        child: Badge(
                          child: Text("NEW",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          badgeContent: Text("3",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          badgeColor: Color(0xFFd40d0d),
                          animationType: BadgeAnimationType.slide,
                        )),
                  ),
                ],
              )),
          Positioned(
              top: MediaQuery.of(context).size.height * 1.5 / 3,
              right: 10,
              child: Column(
                children: [
                  InkWell(
                    hoverColor: Color(0xFF577de2),
                    onTap: () {},
                    child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xFFe3f30c),
                            border: Border(
                                bottom: BorderSide(
                                    width: 2.0, color: Color(0xFF5907125)),
                                right: BorderSide(
                                    width: 2.0, color: Color(0xFF5907125)))),
                        width: 60.0,
                        height: 50.0,
                        child: Icon(
                          Icons.star_rate_outlined,
                          color: Colors.white,
                          size: 32.0,
                        )),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    hoverColor: Color(0xFF577de2),
                    onTap: () {},
                    child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xFF395398),
                            border: Border(
                                bottom: BorderSide(
                                    width: 2.0, color: Color(0xFF1d2846)),
                                right: BorderSide(
                                    width: 2.0, color: Color(0xFF1d2846)))),
                        width: 60.0,
                        height: 50.0,
                        child: Icon(
                          Icons.facebook_outlined,
                          color: Colors.white,
                          size: 32.0,
                        )),
                  ),
                ],
              )),
          Positioned(
              top: MediaQuery.of(context).size.height / 3,
              left: MediaQuery.of(context).size.width / 2 - 100.0,
              child: InkWell(
                hoverColor: Color(0xFFec5449),
                onTap: () => Navigator.of(context).pushNamed("/game"),
                child: Container(
                  width: 200,
                  height: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xFFd44b48), Color(0xFFc0392b)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                      border: Border.all(
                          color: Color(0xFFe8d4bb),
                          width: 5.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Text(
                    "P L A Y",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26.0),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
