import 'package:flutter/material.dart';
import 'package:planets/CustomWidgets/star.dart';

class BackgroundStars extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Star(
          left: 10,
          top: 0,
          iconSize: 5,
        ),
        Star(
          right: 10,
          top: 150,
          iconSize: 8,
        ),
        Star(
          left: 150,
          top: 40,
          iconSize: 4,
        ),
        Star(
          left: 180,
          top: 250,
          iconSize: 6,
        ),
        Star(
          left: 10,
          top: 270,
          iconSize: 10,
        ),
        Star(
          left: 200,
          top: 100,
          iconSize: 8,
        ),
        Star(
          bottom: 10,
          iconSize: 5,
        ),
        Star(
          right: 70,
          bottom: 30,
          iconSize: 8,
        ),
        Star(
          left: 200,
          top: 500,
          iconSize: 4,
        ),
        Star(
          left: 180,
          top: 250,
          iconSize: 6,
        ),
        Star(
          right: 10,
          bottom: 170,
          iconSize: 4,
        ),
        Star(
          left: 200,
          top: 100,
          iconSize: 8,
        ),
      ],
    );
  }
}
