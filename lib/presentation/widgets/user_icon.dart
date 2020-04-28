import 'package:complex_ui/presentation/assets/images.dart';
import 'package:flutter/material.dart';

class UserIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8.0),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: 12.0,
              right: 12.0,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
              child: Image.asset(
                userAvatarImage,
              ),
            ),
          ),
          Positioned(
            right: 0.0,
            top: 0.0,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor,
              ),
              width: 12.0,
              height: 12.0,
            ),
          )
        ],
      ),
    );
  }
}
