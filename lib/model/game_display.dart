class Game {
  String id;
  String imgUrl;
  bool isHot;
  bool isNew;
  bool isFavorite;
  String name;
  String description;
  double rate;
  int people;
  Game(this.id, this.imgUrl, this.isHot, this.isNew, this.isFavorite, this.name,
      this.description, this.people, this.rate);
}
