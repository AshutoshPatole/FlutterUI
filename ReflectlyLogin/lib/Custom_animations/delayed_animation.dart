import 'dart:async';

import 'package:flutter/material.dart';

class DelayedAnimation extends StatefulWidget {
  final Widget child;
  final int delay;

  const DelayedAnimation({Key key, this.delay, this.child});

  @override
  _DelayedAnimationState createState() => _DelayedAnimationState();
}

class _DelayedAnimationState extends State<DelayedAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<Offset> _offset;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    final curve = CurvedAnimation(
        parent: _animationController, curve: Curves.easeOutQuint);
    _offset = Tween<Offset>(begin: const Offset(0.0, 0.35), end: Offset.zero)
        .animate(curve);

    Timer(Duration(milliseconds: widget.delay), () {
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
    return FadeTransition(
      child: SlideTransition(
        child: widget.child,
        position: _offset,
      ),
      opacity: _animationController,
    );
  }
}
