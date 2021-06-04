import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterclock/Config/Data_config.dart';


class MinutesWidget extends CustomPainter {
  final paintIndicator = Paint()
    ..color = taichiTheme[theme.indicatorColor]
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 2
    ..style = PaintingStyle.fill;
  var minute;

  MinutesWidget(this.minute);

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final radius = min(size.width, size.height) * 0.15;

    canvas.translate(centerX, centerY);
    canvas.rotate(-pi * 2 / 3);
    canvas.translate(0, -size.height * 0.2);
    canvas.rotate(pi * 2 / 3);
    var textPainter = TextPainter(
      text: TextSpan(
        text: minute.toString().padLeft(2, '0'),
        style: TextStyle(
          fontSize: radius,
          color: taichiTheme[theme.lightTheme],
          fontWeight: FontWeight.w500,
        ),
      ),
      textAlign: TextAlign.justify,
      textDirection: TextDirection.ltr,
    )..layout();
    textPainter
      ..paint(
        canvas,
        Offset(
          -textPainter.width / 2,
          -(textPainter.height / 2),
        ),
      );

    canvas.save();
    canvas.rotate(radiansPerTick * minute);
    canvas.drawLine(
        Offset(0, -radius * 0.9), Offset(0, -radius * 1.1), paintIndicator);
    canvas.restore();

    canvas.save();
    for (int i = 0; i < minutesInChinese.length; i++) {
      var textPainter = TextPainter(
        text: TextSpan(
          text: minutesInChinese[i],
          style: TextStyle(
            fontSize: radius / 4,
            color: taichiTheme[theme.lightTheme],
          ),
        ),
        textAlign: TextAlign.justify,
        textDirection: TextDirection.ltr,
      )..layout();
      textPainter
        ..paint(
          canvas,
          Offset(-textPainter.width / 2, -(textPainter.height / 2) - radius),
        );

      canvas.rotate(2 * pi / minutesInChinese.length);
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(MinutesWidget oldDelegate) {
    return oldDelegate.minute != minute;
  }
}