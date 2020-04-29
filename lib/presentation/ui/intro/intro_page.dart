import 'package:complex_ui/presentation/assets/dimensions.dart';
import 'package:complex_ui/presentation/assets/images.dart';
import 'package:complex_ui/presentation/navigation/navigation.dart';
import 'package:complex_ui/presentation/widgets/header_widget.dart';
import 'package:complex_ui/presentation/widgets/platform_aware_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textDisplacement = size.height * 0.25;
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarBrightness: Brightness.dark));
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.asset(
          backgroundImage,
          fit: BoxFit.fitHeight,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xB3000000),
                const Color(0x00000000),
              ],
            ),
          ),
        ),
        Positioned(
          left: marginScreen,
          top: textDisplacement,
          child: HeaderWidget(
            title: "Welcome\n",
            subtitle: "to cook book",
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(marginScreen),
              child: SafeArea(
                child: PlatformAwareButton(
                  text: "Start now",
                  onPressed: () => navigateToHome(context),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
