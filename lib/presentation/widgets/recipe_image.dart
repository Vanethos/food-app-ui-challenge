import 'package:complex_ui/data/local/models/recipee.dart';
import 'package:flutter/material.dart';

const radius = 16.0;

typedef void RecipeImageCallback(Recipe recipe, BuildContext context);

class RecipeImage extends StatelessWidget {
  final Recipe recipe;
  final RecipeImageCallback onClicked;

  RecipeImage({this.recipe, this.onClicked, key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClicked != null ? () => onClicked(recipe, context) : null,
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
        child: Image.asset(
          recipe.assetName,
        ),
      ),
    );
  }
}
