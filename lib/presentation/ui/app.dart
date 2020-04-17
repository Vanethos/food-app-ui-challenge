import 'package:complex_ui/data/local/models/recipee.dart';
import 'package:complex_ui/data/local/repositories/recipee_repository.dart';
import 'package:complex_ui/presentation/ui/detail/detail_page.dart';
import 'package:complex_ui/presentation/ui/intro/intro_page.dart';
import 'package:flutter/material.dart';

import 'home/home_page.dart';

const routeDetail = "detail";
const routeHome = "home";
const routeIntro = "intro";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFFfcd340),
      ),
      initialRoute: routeIntro,
      routes: {
        routeIntro: (_) => IntroPage(),
        routeHome: (_) => HomePage(
              recipeeRepository: RecipeeRepository(),
            )
      },
      onGenerateRoute: (settings) {
        if (settings.name == routeDetail) {
          final arg = settings.arguments as Recipe;
          return MaterialPageRoute(
            settings: settings,
            builder: (_) => RecipeDetailpage(recipe: arg),
          );
        }

        return null;
      },
    );
  }
}
