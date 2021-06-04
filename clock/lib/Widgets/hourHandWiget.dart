import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterclock/Config/Data_config.dart';

class HourHandWidget extends CustomPainter {
  var hour;

  HourHandWidget(this.hour);

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final radius = min(size.width, size.height) * 0.15;
    var rect = Rect.fromCircle(
        center: Offset(0, -size.height * 0.2), radius: radius * 1.2);

    final Gradient gradient = LinearGradient(
      colors: [
        taichiTheme[theme.indicatorColor].withOpacity(0.1),
        taichiTheme[theme.indicatorColor],
      ],
    );

    final paintRange = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round
      ..shader = gradient.createShader(rect);

    canvas.translate(centerX, centerY);

    canvas.rotate(pi / 3);
    var startAngle = -pi / 2 - pi / 3;
    canvas.drawArc(rect, startAngle, 2 * pi * hour / 14, false, paintRange);

    canvas.translate(0, -size.height * 0.2);

    canvas.rotate(-pi / 3);
    var textPainter = TextPainter(
      text: TextSpan(
        text: hour.toString(),
        style: TextStyle(
          fontSize: radius,
          fontWeight: FontWeight.w500,
        ),
      ),
      textAlign: TextAlign.justify,
      textDirection: TextDirection.ltr,
    )..layout();
    textPainter
      ..paint(
        canvas,
        Offset(-textPainter.width / 2, -textPainter.height / 2),
      );

    canvas.save();
    for (int i = 0; i < hoursInChinese.length; i++) {
      var textPainter = TextPainter(
        text: TextSpan(
            text: hoursInChinese[i],
            style: TextStyle(
              fontSize: radius / 4,
              color: taichiTheme[theme.darkTheme],
            )),
        textAlign: TextAlign.justify,
        textDirection: TextDirection.ltr,
      )..layout();
      textPainter
        ..paint(
          canvas,
          Offset(-textPainter.width / 2, -(textPainter.height / 2) - radius),
        );
      canvas.rotate(2 * pi / hoursInChinese.length);
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(HourHandWidget oldDelegate) {
    return oldDelegate.hour != hour;
  }
}
