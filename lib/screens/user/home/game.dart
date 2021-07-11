import 'dart:async';

import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:game_app/providers/game_provider.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    final listGame = Provider.of<GameProvider>(context).listGame;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.grey,
        body: Container(
          padding: const EdgeInsets.only(top: 30),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 300,
                        height: 290,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/gameboard.png"),
                                fit: BoxFit.fill)),
                        child: Container(
                          margin: const EdgeInsets.all(10.0),
                          child: Container(
                            child: Image.asset(
                              listGame[index].imgUrl,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 10,
                        bottom: 10,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.star_rate, color: Colors.yellow),
                        ),
                      ),
                      if (listGame[index].isNew)
                        Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              color: Colors.green,
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "New",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            )),
                      if (listGame[index].isHot)
                        Positioned(
                            top: 0.0,
                            left: 0,
                            child: Container(
                              color: Colors.red,
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "HOT",
                                style: TextStyle(
                                    fontSize: 17.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            )),
                    ],
                  ),
                  SizedBox(height: 40),
                  Container(
                    width: 250.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/info.png"),
                            fit: BoxFit.fill)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            listGame[index].name,
                            style: TextStyle(
                                fontSize: 24.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            "${listGame[index].people} people has been played",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w400),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            "Rate: ${listGame[index].rate}/5.0",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
            onTap: (index) {
              Navigator.of(context).pushNamed(getRouteName(index));
            },
            itemCount: listGame.length,
            autoplay: true,
            loop: true,
            viewportFraction: 0.7,
            duration: 1500,
            scale: 0.8,
            index: 0,
          ),
        ));
  }

  String getRouteName(int index) {
    switch (index) {
      case 0:
        return "/taptheblack";
      case 1:
        return "/snake";
      default:
        break;
    }
    return "";
  }
}
