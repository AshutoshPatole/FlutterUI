import 'package:chatapp/Data/Utils.dart';
import 'package:flutter/material.dart';

class YellowColor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 180,
      right: 80,
      child: Container(
        width: 130,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(100.0),
            topLeft: Radius.circular(100.0),
          ),
          color: Utils().yellowColor,
        ),
      ),
    );
  }
}
