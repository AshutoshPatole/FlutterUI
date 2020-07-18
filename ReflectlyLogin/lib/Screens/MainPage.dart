import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reflctlylogin/Custom_Widgets/Bouncing_Button.dart';
import 'package:reflctlylogin/Custom_animations/delayed_animation.dart';
import 'package:reflctlylogin/Reflectly/AskName.dart';
import 'package:reflctlylogin/Reflectly/LastPage.dart';
import 'package:reflctlylogin/Reflectly/LoginUI1.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  final int delayedAmount = 500;
  AnimationController _controller;
  PageController _pageController = new PageController();
  final color = Colors.white;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8185E2),
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Column(
              children: <Widget>[
                LoginUI1(),
                DelayedAnimation(
                  child: GestureDetector(
                    onTapDown: _onTapDown,
                    onTapUp: _onTapUp,
                    onTap: () {
                      _pageController.animateToPage(
                        1,
                        duration: Duration(seconds: 4),
                        curve: Curves.easeOutExpo,
                      );
                    },
                    child: BouncingButton(),
                  ),
                  delay: delayedAmount + 4000,
                ),
                SizedBox(
                  height: 50.0,
                ),
                DelayedAnimation(
                  child: Text(
                    "I Already have An Account".toUpperCase(),
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: color),
                  ),
                  delay: delayedAmount + 5000,
                ),
              ],
            ),
            AskName(),
            LastPage(),
          ],
        ),
      ),
    );
  }
}
