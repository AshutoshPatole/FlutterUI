import 'package:flutter/material.dart';

class ReflectlyHomePage extends StatefulWidget {
  @override
  _ReflectlyHomePageState createState() => _ReflectlyHomePageState();
}

class _ReflectlyHomePageState extends State<ReflectlyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("HomePage"),
        ),
      ),
    );
  }
}
