import 'package:flutter/foundation.dart';
import 'package:game_app/model/game_display.dart';

class GameProvider with ChangeNotifier {
  List<Game> _listGame = [
    Game(
        "tap the black",
        "http://via.placeholder.com/300x300",
        true,
        false,
        true,
        "Tap The Black",
        "asdjiadjifjlsdfjslkdgjslkgjslkdjgslkdjfsjdfiosjdigfsjd",
        100,
        4.9),
    Game(
        "snake",
        "http://via.placeholder.com/300x300",
        false,
        true,
        true,
        "Snake",
        "dhasuhasudhuagfhoisfnvnmcx,zhvuiweoierjwsalifjmsalfjaspf",
        199,
        4.5)
  ];

  List<Game> get listGame => _listGame;

  List<Game> favoriteGame() =>
      _listGame.where((element) => element.isFavorite).toList();

  List<Game> hotAndNewGame() =>
      _listGame.where((element) => element.isHot).toList();

  // List<Game> newGame() => _listGame.where((element) => element.isNew).toList();
}
