import 'package:flutter/foundation.dart';
import 'package:game_app/model/game_display.dart';

class GameProvider with ChangeNotifier {
  List<Game> _listGame = [
    Game("taptheblack", "assets/images/taptheblack.png", true, false, true,
        "Tap The Black", 100, 4.9),
    Game("snake", "assets/images/snake.png", false, true, true, "Snake", 199,
        4.5)
  ];

  List<Game> get listGame => _listGame;

  List<Game> favoriteGame() =>
      _listGame.where((element) => element.isFavorite).toList();

  List<Game> hotAndNewGame() =>
      _listGame.where((element) => element.isHot || element.isNew).toList();
}
