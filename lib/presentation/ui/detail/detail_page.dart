import 'package:complex_ui/data/local/models/recipee.dart';
import 'package:complex_ui/presentation/assets/dimensions.dart';
import 'package:complex_ui/presentation/widgets/header_widget.dart';
import 'package:complex_ui/presentation/widgets/platform_aware_button.dart';
import 'package:complex_ui/presentation/widgets/recipe_image.dart';
import 'package:complex_ui/presentation/widgets/user_icon.dart';
import 'package:flutter/material.dart';

class RecipeDetailPage extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetailPage({Key key, this.recipe}) : super(key: key);
  @override
  _RecipeDetailPageState createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: <Widget>[
          UserIcon(),
        ],
        elevation: 0,
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Stack(children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                left: marginScreen,
                right: marginScreen,
                top: marginRecipeTop,
                bottom: marginRecipeBottom
              ),
              child: RecipeNameWidget(
                recipe: widget.recipe,
              ),
            ),
            SafeArea(
              child: RecipeImage(
                recipe: widget.recipe,
              ),
            )
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: BottomDetailWidget(
            recipe: widget.recipe,
          ),
        )
      ]),
    );
  }
}

class RecipeNameWidget extends StatelessWidget {
  const RecipeNameWidget({Key key, @required this.recipe}) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        HeaderWidget(
          title: "The best\n",
          subtitle: "${recipe.name}",
        ),
        const SizedBox(
          height: marginSmall,
        ),
        Row(
          children: <Widget>[
            StarsWidget(
              stars: recipe.startCount,
            ),
            const SizedBox(
              width: marginMini,
            ),
            Text(
              "${recipe.reviewCount} reviews",
              style: Theme.of(context).textTheme.bodyText2,
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
      padding: EdgeInsets.all(marginScreen),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(radius),
          topLeft: Radius.circular(radius),
        ),
      ),
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
                  icon: Icons.add_box,
                ),
                DetailWidget(
                  text: "${recipe.minDuration.inMinutes} min",
                  icon: Icons.access_time,
                ),
              ],
            ),
            const SizedBox(
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
                    ),
                  ),
                  const SizedBox(
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
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
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
      size: iconSmallSize,
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
          size: iconSize,
        ),
        Text(
          " $text",
          style: Theme.of(context).textTheme.bodyText1,
        )
      ],
    );
  }
}
