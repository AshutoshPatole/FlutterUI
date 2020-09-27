import 'package:flutter/material.dart';
// import 'package:portfolio/Screens/homeScreen.dart';

import 'Screens/loginScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
