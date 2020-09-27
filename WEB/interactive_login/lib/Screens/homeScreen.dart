import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        actions: [
          Icon(Icons.ac_unit),
        ],
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
