import 'package:flutter/material.dart';
import 'package:fruits_app/Widgets/menuIcon.dart';

class TopBar extends StatelessWidget {
  final Color color;

  const TopBar({this.color});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Center(
            child: Icon(
              Icons.arrow_back_ios,
              size: 12,
              
            ),
          ),
        ),
        MenuButton()
      ],
    );
  }
}
