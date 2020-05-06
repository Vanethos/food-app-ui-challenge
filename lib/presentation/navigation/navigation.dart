import 'package:complex_ui/data/local/models/recipee.dart';
import 'package:complex_ui/data/local/repositories/recipee_repository.dart';
import 'package:complex_ui/presentation/ui/app.dart';
import 'package:flutter/material.dart';
import 'package:complex_ui/presentation/ui/home/home_page.dart';

Future<void> navigateToHome(BuildContext context) {
//  return Navigator.of(context).pushReplacementNamed(routeHome);
  return Navigator.of(context).push(PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => HomePage(
      recipeRepository: RecipeRepository(),
    ),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child
      );
    },
  ));
}

Future<void> navigateToDetail(BuildContext context, Recipe recipe) {
  // Close keyboard to avoid resizing issues when returning to Home
  FocusScope.of(context).requestFocus(FocusNode());
  return Navigator.of(context).pushNamed(routeDetail, arguments: recipe);
}