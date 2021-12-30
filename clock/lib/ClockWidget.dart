import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'Config/Data_config.dart';
import 'Widgets/clockParts.dart';
import 'Widgets/hourHandWiget.dart';
import 'Widgets/minuteHandWidget.dart';
import 'Widgets/secondHandWidget.dart';
import 'package:intl/intl.dart';

class ClockWidget extends StatefulWidget {
  @override
  _ClockWidgetState createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget>
    with SingleTickerProviderStateMixin {
  final temperature = Random().nextInt(35).clamp(15, 35);

  var secondOffset = 0.0;
  var hourNum = 0;
  var minuteNum = 0;
  var showDate;

  late DateTime datetime;
  late Timer timer;

  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    updateTime();
    startAnim();

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      startAnim();
      updateTime();
      setState(() {});
    });
  }

  void updateTime() {
    datetime = DateTime.now();
    hourNum = int.parse(DateFormat.jm().format(DateTime.now()).substring(0, 1));
    minuteNum = datetime.minute;
    secondOffset = datetime.second * radiansPerTick;
    showDate =
        '${weekdayList[datetime.weekday - 1]}\n${monthList[datetime.month - 1]} ${datetime.day}';
  }

  void startAnim() {
    animation =
        Tween(begin: secondOffset, end: secondOffset + radiansPerTick).animate(
      CurvedAnimation(
        parent: controller,
        curve: _BounceOutCurve._(),
      ),
    );
    secondOffset += radiansPerTick;
    controller.reset();
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              width: double.infinity,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      CustomPaint(
                        painter: ClockParts(),
                      ),
                      AnimatedBuilder(
                        builder: (context, widget) {
                          return CustomPaint(
                            painter: SecondHandWidget(animation.value),
                          );
                        },
                        animation: animation,
                      ),
                      CustomPaint(
                        painter: HourHandWidget(hourNum),
                      ),
                      CustomPaint(
                        painter: MinutesWidget(minuteNum),
                      ),
                      Positioned(
                        child: Text(
                          showDate,
                          style: TextStyle(
                            fontSize: constraints.maxWidth / 20,
                            color: taichiTheme[theme.lightTheme],
                          ),
                        ),
                        top: constraints.maxHeight * 0.23,
                        left: constraints.maxWidth * 0.25,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BounceOutCurve extends Curve {
  const _BounceOutCurve._();

  @override
  double transform(double t) {
    t -= 1.0;
    return t * t * (3 * t + 2) + 1.0;
  }
}
