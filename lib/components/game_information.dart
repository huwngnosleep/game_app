import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:game_app/providers/game_provider.dart';
import 'package:provider/provider.dart';

class GameInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final listGame = Provider.of<GameProvider>(context).listGame;
    return Container(
      width: 280,
      height: 160,
      child: Swiper(

        index: 0,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 280.0,
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    listGame[index].name,
                    style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  child: Text(
                    listGame[index].description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "${listGame[index].people} people has been played",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
                  ),
                ),
                Text(
                  "Rate: ${listGame[index].rate}/5.0",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          );
        },
        itemCount: listGame.length,
        autoplay: true,
        loop: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
