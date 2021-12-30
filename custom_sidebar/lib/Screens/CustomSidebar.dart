import 'package:flutter/material.dart';
import 'BackPage.dart';
import 'FrontPage.dart';

class CustomSidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          BackPage(),
          FrontPage(),
        ],
      ),
    );
  }
}
