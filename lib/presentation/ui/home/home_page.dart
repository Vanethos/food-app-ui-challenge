import 'package:complex_ui/data/local/models/recipe.dart';
import 'package:complex_ui/data/local/repositories/recipe_repository.dart';
import 'package:complex_ui/presentation/navigation/navigation.dart';
import 'package:complex_ui/presentation/ui/intro/intro_page.dart';
import 'package:complex_ui/presentation/widgets/recipe_image.dart';
import 'package:complex_ui/presentation/widgets/user_icon.dart';
import 'package:flutter/material.dart';

const marginText = 34.0;
const marginItems = 16.0;
const sizeIcon = 16.0;
const marginSmall = 12.0;
const fontSizeRecommendations = 20.0;

class HomePage extends StatefulWidget {
  final RecipeRepository recipeRepository;

  HomePage({Key key, this.recipeRepository}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: <Widget>[
          UserIcon(),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: screenMargin, right: screenMargin, top: marginText
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GreetingText(),
                SizedBox(
                  height: marginText,
                ),
                ChipSearchBar(),
                SizedBox(
                  height: marginItems,
                ),
                RecipeGrid(
                  children: widget.recipeRepository
                      .getSpecialRecipes()
                      .map((recipe) => Hero(
                        tag: recipe.name,
                        child: RecipeImage(
                          recipe: recipe,
                          onClicked: (recipe, context) => navigateToDetail(context, recipe),
                        ),
                      ))
                      .toList(),
                ),
                SizedBox(
                  height: marginItems,
                ),
              ],
            ),
          ),
          Recommendations(
            children: widget.recipeRepository
              .getRecommendations()
              .map((recipe) => RecipeImage(
                recipe: recipe,
                onClicked: (recipe, context) => navigateToDetail(context, recipe),
              )).toList()
          )
        ],
      ),
    );
  }
}

class GreetingText extends StatelessWidget {
  String _getGreeting() {
    var time = DateTime.now();
    if (time.hour > 3 && time.hour < 12) {
      return "morning";
    } else if (time.hour < 18) {
      return "evening";
    } else {
      return "night";
    }
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        style: TextStyle(
          color: Colors.black,
          fontSize: fontSizeIntro,
          fontWeight: FontWeight.w300
        ),
        children: <TextSpan>[
          TextSpan(text: "Good "),
          TextSpan(
            text: "${_getGreeting()}!",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: fontSizeIntro,
            ),
          ),
        ],
      ),
    );
  }
}

class ChipSearchBar extends StatefulWidget {
  @override
  _ChipSearchBarState createState() => _ChipSearchBarState();
}

class _ChipSearchBarState extends State<ChipSearchBar> {
  final _selectedWidgets = <CookChip>[];
  final _textController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      children: (<Widget>[
        TextFormField(
          textInputAction: TextInputAction.done,
          controller: _textController,
          focusNode: _focusNode,
          decoration: InputDecoration(suffixIcon: Icon(Icons.search)),
          onFieldSubmitted: (value) {
            _selectedWidgets.add(CookChip(
              key: Key(value),
              text: value,
              onDeleted: () => setState(() {
                removeChipWithValue(value);
              })
            ));
            _textController.clear();
            setState(() {});
            _focusNode.requestFocus();
          }
        ),
        ..._selectedWidgets,
      ])
    );
  }

  void removeChipWithValue(String value) {
    for (var cookChip in _selectedWidgets) {
      if (cookChip.text == value) {
        _selectedWidgets.remove(cookChip);
        break;
      }
    }
  }
}

class CookChip extends StatefulWidget {
  final Key key;
  final String text;
  final VoidCallback onDeleted;

  CookChip({this.key, this.text, this.onDeleted}) : super(key: key);

  @override
  _CookChipState createState() => _CookChipState();
}

class _CookChipState extends State<CookChip> with TickerProviderStateMixin{
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 150),
    );
    _animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: _animationController,
      axis: Axis.horizontal,
      child: Chip(
        label: Text(widget.text),
        deleteIcon: Icon(Icons.clear, size: sizeIcon),
        onDeleted: onDeleted,
      ),
    );
  }

  void onDeleted(){
    _animationController.reverse().then((_) => widget.onDeleted());
  }
}

class RecipeGrid extends StatelessWidget {
  final List<Widget> children;

  RecipeGrid({this.children, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        final size = constraint.biggest;
        final smallBoxSize = (size.width - 2 * marginSmall) / 3;
        final bigBoxSize = smallBoxSize * 2 + marginSmall;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(
                      width: smallBoxSize,
                      height: smallBoxSize,
                      child: children[0],
                    ),
                    SizedBox(
                      height: marginSmall,
                    ),
                    SizedBox(
                      width: smallBoxSize,
                      height: smallBoxSize,
                      child: children[1],
                    ),
                  ],
                ),
                SizedBox(
                  width: marginSmall,
                ),
                SizedBox(
                  width: bigBoxSize,
                  height: bigBoxSize,
                  child: children[2],
                ),
              ],
            ),
            SizedBox(
              height: marginSmall,
            ),
            Row(children: <Widget>[
              SizedBox(
                width: smallBoxSize,
                height: smallBoxSize,
                child: children[3],
              ),
              SizedBox(
                width: marginSmall,
              ),
              SizedBox(
                width: smallBoxSize,
                height: smallBoxSize,
                child: children[4],
              ),
              SizedBox(
                width: marginSmall,
              ),
              SizedBox(
                width: smallBoxSize,
                height: smallBoxSize,
                child: children[5],
              ),
            ])
          ],
        );
      },
    );
  }

  Widget _getThreeChildView(List<Widget> children) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: marginSmall),
                child: children[0]
              ),
              children[1],
            ],
          ),
        ),
        SizedBox(width: marginSmall),
        Expanded(flex: 2, child: children[2]),
      ],
    );
  }
}

class Recommendations extends StatelessWidget {
  final List<Widget> children;

  Recommendations({this.children, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemSize = MediaQuery.of(context).size.width / 3;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: screenMargin, bottom: marginSmall),
          child: RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              style: TextStyle(
                color: Colors.black,
                fontSize: fontSizeRecommendations,
              ),
              children: <TextSpan>[
                TextSpan(text: "Your special\n"),
                TextSpan(
                  text: "recommendations",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: fontSizeRecommendations,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: itemSize,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(width: screenMargin),
              ...children
                .map((recipe) => Container(
                  child: recipe,
                  margin: EdgeInsets.only(right: marginSmall)
                )).toList()],
          )
        )
      ],
    );
  }
}
