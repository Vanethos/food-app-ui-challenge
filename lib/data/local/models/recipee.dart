class Recipe {
  String name;
  int pieces;
  int calories;
  Duration minDuration;
  Duration maxDuration;
  String assetName;
  bool isFavorite;
  int startCount;
  int reviewCount;

  Recipe(this.name, this.pieces, this.calories, this.minDuration, 
      this.maxDuration, this.assetName, this.startCount, this.reviewCount, {this.isFavorite = false});
}
