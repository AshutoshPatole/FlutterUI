import 'dart:async';

import 'package:flutter/material.dart';

class BouncingButton extends StatefulWidget {
  @override
  _BouncingButtonState createState() => _BouncingButtonState();
}

class _BouncingButtonState extends State<BouncingButton>
    with SingleTickerProviderStateMixin {
  double scale = 0.0;
  Animation _sizeAnimation;
  double _animationValue;

  AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    _sizeAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.bounceInOut));
    _animationController.addListener(() {
      _animationValue = _animationController.value;
      if (_animationValue < 0.1) {
        scale = 0.1;
      }
      if (_animationValue > 0.1 && _animationValue < 0.2) {
        scale = 0.3;
      }
      if (_animationValue > 0.2 && _animationValue < 0.3) {
        scale = 0.43;
      }
      if (_animationValue > 0.3 && _animationValue < 0.4) {
        scale = 0.55;
      }
      if (_animationValue > 0.4 && _animationValue < 0.5) {
        scale = 0.66;
      }
      if (_animationValue > 0.5 && _animationValue < 0.6) {
        scale = 0.79;
      }
      if (_animationValue > 0.6 && _animationValue < 0.7) {
        scale = 1.1;
      }
      if (_animationValue > 0.7 && _animationValue < 0.8) {
        scale = 1.3;
      }
      if (_animationValue > 0.8 && _animationValue < 0.9) {
        scale = 1.1;
      }
      if (_animationValue > 0.9 && _animationValue <= 1.0) {
        scale = 1.0;
      }
    });
    super.initState();
    Timer(Duration(milliseconds: 4500), () {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _sizeAnimation,
      child: _animatedButtonUI,
      builder: (BuildContext context, child) {
        return Transform.scale(
          scale: scale,
          child: child,
        );
      },
    );
  }
}

Widget get _animatedButtonUI => Container(
      height: 60,
      width: 270,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Colors.white,
      ),
      child: Center(
        child: Text(
          'Hi Reflectly',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF8185E2),
          ),
        ),
      ),
    );
