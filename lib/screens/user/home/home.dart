import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.network(
              "https://st3.depositphotos.com/1340907/14598/v/600/depositphotos_145988561-stock-illustration-pixel-art-forest.jpg",
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
              left: 10,
              top: MediaQuery.of(context).size.height * 1.5 / 3,
              child: Column(
                children: [
                  InkWell(
                    onTap: () => Navigator.of(context).pushNamed("/wheel"),
                    child: Badge(
                      position: BadgePosition(top: -2, end: -2),
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
                      badgeContent: Text("!",
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
                        width: 70.0,
                        height: 60.0,
                        child: Badge(
                          child: Image.asset(
                            "assets/images/hotandnew.png",
                            fit: BoxFit.fill,
                          ),
                          badgeContent: Text("3",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          badgeColor: Color(0xFFd40d0d),
                          animationType: BadgeAnimationType.slide,
                        )),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    splashColor: Color(0xFF577de2),
                    onTap: () => Navigator.of(context)
                        .pushNamed('/chart', arguments: {0}),
                    child: Container(
                      width: 60.0,
                      height: 55.0,
                      child: Image.asset(
                        "assets/images/rank.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              )),
          Positioned(
              top: MediaQuery.of(context).size.height * 1.5 / 3,
              right: 10,
              child: Column(
                children: [
                  InkWell(
                    splashColor: Color(0xFF577de2),
                    onTap: () => Navigator.of(context).pushNamed("/user"),
                    child: Container(
                      width: 60.0,
                      height: 55.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/images/button.png"))),
                      child: Icon(
                        Icons.person,
                        size: 26.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    splashColor: Color(0xFF577de2),
                    onTap: () {},
                    child: Container(
                      width: 60.0,
                      height: 60.0,
                      child: Image.asset(
                        "assets/images/rate.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    splashColor: Color(0xFF577de2),
                    onTap: () {},
                    child: Container(
                      width: 60.0,
                      height: 55.0,
                      child: Image.asset(
                        "assets/images/fb.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              )),
          Positioned(
              top: MediaQuery.of(context).size.height / 3,
              left: MediaQuery.of(context).size.width / 2 - 100.0,
              child: InkWell(
                splashColor: Color(0xFFec5449),
                onTap: () => Navigator.of(context).pushNamed("/game"),
                child: Container(
                    width: 200,
                    height: 70,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        image: DecorationImage(
                            image: AssetImage("assets/images/play.png"),
                            fit: BoxFit.fill))),
              ))
        ],
      ),
    );
  }
}
