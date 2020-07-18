import 'package:chatapp/Data/Utils.dart';
import 'package:flutter/material.dart';

class OrangeColor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -220,
      left: -120,
      child: Container(
        width: 400,
        height: 400,
        decoration: BoxDecoration(
          color: Utils().orangeColor,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
