import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BackgroundStar extends StatelessWidget {
  final double top, left, right, bottom, iconSize;

  const BackgroundStar(
      {this.top, this.left, this.right, this.bottom, this.iconSize});

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
