import 'dart:io';

import 'package:complex_ui/presentation/navigation/navigation.dart';
import 'package:complex_ui/presentation/widgets/platform_aware_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const fontSizeIntro = 28.0;
const screenMargin = 24.0;


class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textDisplacement = size.height * 0.25;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark
    ));
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.asset(
          "assets/app/intro.jpg",
          fit: BoxFit.fitHeight,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [const Color(0xB3000000), const Color(0x00000000)],
            ),
          ),
        ),
        Positioned(
          left: screenMargin,
          top: textDisplacement,
          child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSizeIntro,
                      fontWeight: FontWeight.w300),
                  children: <TextSpan>[
                    TextSpan(text: "Welcome\n"),
                    TextSpan(
                        text: "to cook book",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: fontSizeIntro,
                        ))
                  ])),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(screenMargin),
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


