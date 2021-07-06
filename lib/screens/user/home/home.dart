import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:game_app/components/game_information.dart';
import 'package:game_app/providers/game_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int gameIndex = 0;
  @override
  Widget build(BuildContext context) {
    final listGame = Provider.of<GameProvider>(context).listGame;
    return Scaffold(
        backgroundColor: Colors.grey,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {},
                    child: Stack(
                      children: [
                        Image.network(
                          listGame[index].imgUrl,
                          fit: BoxFit.fill,
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
                  );
                },
                itemCount: listGame.length,
                autoplay: true,
                loop: true,
                viewportFraction: 0.7,
                scale: 0.8,
              ),
            ),
            SizedBox(height: 40.0),
            GameInformation()
          ],
        ));
  }
}
