import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Star extends StatelessWidget {
  final double top, left, right, bottom, iconSize;

  const Star({
    this.top = 0,
    this.left = 0,
    this.right = 0,
    this.bottom = 0,
    this.iconSize = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: top,
            left: left,
            bottom: bottom,
            right: right,
            child: Icon(
              FontAwesomeIcons.solidStar,
              size: iconSize,
              color: Colors.yellow,
            ),
          )
        ],
      ),
    );
  }
}
