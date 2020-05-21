import 'package:complex_ui/data/local/models/recipee.dart';
import 'package:complex_ui/data/local/repositories/recipee_repository.dart';
import 'package:complex_ui/presentation/assets/dimensions.dart';
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
        accentColor: Color(0xFFfcd340),
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        buttonColor: Color(0xFFfcd340),
        appBarTheme: AppBarTheme(
          color: Colors.white,
        ),
        textTheme: TextTheme(
          headline1: const TextStyle(
            color: Colors.black,
            fontSize: fontSizeLargest,
            fontWeight: FontWeight.bold,
          ),
          headline2: const TextStyle(
            color: Colors.black,
            fontSize: fontSizeLarge,
            fontWeight: FontWeight.bold,
          ),
          button: const TextStyle(
            fontSize: fontSizeLarge,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          bodyText1: const TextStyle(
            fontSize: fontSizeMedium,
            color: Colors.black,
          ),
          bodyText2: const TextStyle(
            fontSize: fontSizeSmall,
            color: Colors.white,
          ),
        ),
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
            builder: (_) => RecipeDetailPage(
              recipe: arg,
            ),
          );
        }

        return null;
      },
    );
  }
}
