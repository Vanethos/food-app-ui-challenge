import 'package:complex_ui/data/local/models/recipee.dart';
import 'package:complex_ui/presentation/ui/app.dart';
import 'package:flutter/material.dart';

Future<void> navigateToHome(BuildContext context) {
  return Navigator.of(context).pushReplacementNamed(routeHome);
}

Future<void> navigateToDetail(BuildContext context, Recipe recipe) {
  return Navigator.of(context).pushNamed(routeDetail, arguments: recipe);
}