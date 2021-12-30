import 'package:flutter/material.dart';

import '../Data/Utils.dart';

class PinkColor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -70,
      right: -100,
      child: Container(
        width: 400,
        height: 400,
        decoration: BoxDecoration(
          color: Utils().pinkColor,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
