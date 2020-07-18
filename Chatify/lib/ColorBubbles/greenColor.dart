import 'package:chatapp/Data/Utils.dart';
import 'package:flutter/material.dart';

class GreenColor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      right: -10,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Utils().greenColor,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
