import 'package:flutter/material.dart';

class HomeBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(
          Icons.menu,
          color: Colors.white,
        ),
        Stack(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            Positioned(
              left: 0,
              right: -10,
              top: 15,
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
