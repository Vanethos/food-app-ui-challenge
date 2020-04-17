import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const fontSizeButton = 18.0;
const buttonInsidePadding = 16.0;

class PlatformAwareButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  PlatformAwareButton({this.onPressed, this.text, key}) : super (key : key);
  
  @override
  Widget build(BuildContext context) {
    final Widget textWidget = Text(text, style: TextStyle(fontSize: fontSizeButton, color: Colors.black));
    if (Platform.isAndroid) {
      return RaisedButton(
                  padding: EdgeInsets.all(buttonInsidePadding),
                  child:  textWidget,
                  color: Theme.of(context).primaryColor,
                  onPressed: onPressed,
                );
    }
    return CupertinoButton(
        padding: EdgeInsets.all(buttonInsidePadding),
        child: textWidget,
        onPressed: onPressed,
        color: Theme.of(context).primaryColor,
      );
  }
}