import 'package:complex_ui/data/local/models/recipee.dart';
import 'package:complex_ui/presentation/ui/home/home_page.dart';
import 'package:complex_ui/presentation/ui/intro/intro_page.dart';
import 'package:complex_ui/presentation/widgets/platform_aware_button.dart';
import 'package:complex_ui/presentation/widgets/recipe_image.dart';
import 'package:complex_ui/presentation/widgets/user_icon.dart';
import 'package:flutter/material.dart';

const marginTop = 36.0;
const marginBottom = 12.0;
const iconSize = 12.0;
const textSizeReview = 12.0;
const textSizeDetails = 16.0;
const iconSizeDetails = 16.0;
const marginMini = 4.0;
const marginMedium = 16.0;

class RecipeDetailpage extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetailpage({Key key, this.recipe}) : super(key: key);
  @override
  _RecipeDetailpageState createState() => _RecipeDetailpageState();
}

class _RecipeDetailpageState extends State<RecipeDetailpage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: <Widget>[UserIcon()],
        elevation: 0,
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Stack(children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: screenMargin,
                  right: screenMargin,
                  top: marginTop,
                  bottom: marginBottom),
              child: RecipeNameWidget(recipe: widget.recipe),
            ),
            SafeArea(child: RecipeImage(recipe: widget.recipe))
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: BottomDetailWidget(recipe: widget.recipe),
        )
      ]),
    );
  }
}

class RecipeNameWidget extends StatelessWidget {
  const RecipeNameWidget({
    Key key,
    @required this.recipe
  }) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
            style: TextStyle(
                color: Colors.white,
                fontSize: fontSizeIntro,
                fontWeight: FontWeight.w300),
            children: <TextSpan>[
              TextSpan(text: "The best\n"),
              TextSpan(
                text: recipe.name.toLowerCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: fontSizeIntro,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: marginSmall,
        ),
        Row(
          children: <Widget>[
            StarsWidget(
              stars: recipe.startCount,
            ),
            SizedBox(
              width: marginMini,
            ),
            Text(
              "${recipe.reviewCount} reviews",
              style: TextStyle(
                  color: Colors.white, fontSize: textSizeReview),
            )
          ],
        )
      ],
    );
  }
}

class BottomDetailWidget extends StatelessWidget {
  const BottomDetailWidget({
    Key key,
    @required this.recipe,
  }) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(screenMargin),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(radius),
                topLeft: Radius.circular(radius))),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  DetailWidget(
                    text: "${recipe.pieces} pieces",
                    icon: Icons.adjust,
                  ),
                  DetailWidget(
                      text: "${recipe.calories} cal",
                      icon: Icons.add_box),
                  DetailWidget(
                      text: "${recipe.minDuration.inMinutes} min",
                      icon: Icons.access_time),
                ],
              ),
              SizedBox(
                height: marginItems,
              ),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                        flex: 4,
                        child: PlatformAwareButton(
                          text: "Start cooking",
                          onPressed: () => print("Yay!"),
                        )),
                    SizedBox(
                      width: marginMedium,
                    ),
                    AspectRatio(
                        aspectRatio: 1.0,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12.0),
                              ),
                              border: Border.all()),
                          child: Icon(Icons.favorite),
                        ))
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class StarsWidget extends StatelessWidget {
  final int stars;

  const StarsWidget({Key key, this.stars}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<Widget> list = [];
    for (int i = 0; i < 5; i++) {
      if (i < (stars - 1)) {
        list.add(StarWidget(
          isFull: true,
        ));
      } else {
        list.add(StarWidget(
          isFull: false,
        ));
      }
    }
    return Row(
      children: list,
    );
  }
}

class StarWidget extends StatelessWidget {
  final bool isFull;

  const StarWidget({Key key, this.isFull}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      isFull ? Icons.star : Icons.star_border,
      color: Theme.of(context).primaryColor,
      size: iconSize,
    );
  }
}

class DetailWidget extends StatelessWidget {
  final String text;
  final IconData icon;

  const DetailWidget({Key key, this.text, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          icon,
          color: Theme.of(context).primaryColor,
          size: iconSizeDetails,
        ),
        Text(
          " $text",
          style: TextStyle(fontSize: textSizeDetails),
        )
      ],
    );
  }
}
