import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            'Design yet to be implemented\n\n\n \t\t\t\t\t\t\t\t\t\t Home Screen',
            style: TextStyle(
              color: Colors.orange,
              fontSize: 24.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
