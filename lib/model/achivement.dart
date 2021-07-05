class Achievement {
  static List<Achievement> get userAchievement => [
        Achievement(1, "Tap The Black", "102"),
        Achievement(3, "Snake Game", "33"),
        Achievement(10, "2048", "1003"),
      ];

  int rank;
  String game;
  String point;
  Achievement(this.rank, this.game, this.point);
}
