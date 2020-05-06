import 'package:complex_ui/data/local/models/recipee.dart';

class RecipeRepository {
  RecipeRepository();

  final List<Recipe> recipes = [
    Recipe("Chicken Tinga Tacos", 3, 1032, Duration(minutes: 20), Duration(minutes: 30), "assets/recipe/chicken_taco.jpg", 3, 12),
    Recipe("Omelette Sticks", 12, 206, Duration(minutes: 20), null, "assets/recipe/omelette_sticks.jpg", 4, 24),
    Recipe("Vegan Supreme Pizza", 1, 1077, Duration(hours: 9, minutes: 20), Duration(hours: 9, minutes: 40), "assets/recipe/vegan_supreme_pizza.jpg", 5, 89),
    Recipe("Vegan Brownies", 12, 329, Duration(hours: 2, minutes: 20), Duration(hours: 2, minutes: 30), "assets/recipe/vegan_brownies.jpg", 2, 1),
    Recipe("American-style Pancakes", 5, 252, Duration(minutes: 30), Duration(minutes: 40), "assets/recipe/american_pancakes.jpg", 3, 90),
    Recipe("Blueberry Yoghurt", 3, 123, Duration(hours: 13), null, "assets/recipe/yoghurt.jpg", 3, 129),
  ];

  // Get list with recipes
  List<Recipe> getSpecialRecipes() {
    return recipes;
  }

  // Get recommendations
  List<Recipe> getRecommendations() {
    return recipes.getRange(0, 3).toList();
  }
}