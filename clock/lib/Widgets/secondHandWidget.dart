import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterclock/Config/Data_config.dart';

class SecondHandWidget extends CustomPainter {
  final paintNumber = Paint()..color = taichiTheme[theme.numbers]!;

  final paintIndicator = Paint()
    ..color = taichiTheme[theme.indicatorColor]!
    ..style = PaintingStyle.fill;

  final paintOutCircleStroke = Paint()
    ..color = taichiTheme[theme.shadow]!
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1;

  var offset;

  SecondHandWidget(this.offset);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final radius = min(size.width, size.height) * 0.4;
    final paintOutCircle = Paint()
      ..color = taichiTheme[theme.lightTheme]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = radius / 8;

    canvas.drawCircle(Offset(centerX, centerY), radius * 1.05, paintOutCircle);
    canvas.translate(centerX, centerY);
    canvas.rotate(pi / 2 + offset);

    for (int i = 0; i < 60; i++) {
      canvas.save();
      canvas.translate(0, -radius);
      canvas.rotate(-pi / 2);
      canvas.drawCircle(Offset(radius * 0.05, 0), radius / 60, paintNumber);
      canvas.restore();
      canvas.rotate(radiansPerTick);
    }
    canvas.restore();

    canvas.translate(centerX, centerY);
    canvas.drawCircle(Offset(radius * 1.05, 0), radius / 15, paintNumber);
    var textPainter = TextPainter(
      text: TextSpan(
        text: DateTime.now().second.toString(),
        style: TextStyle(
          fontSize: radius / 12,
          color: taichiTheme[theme.indicatorColor],
          fontWeight: FontWeight.bold,
        ),
      ),
      textAlign: TextAlign.justify,
      textDirection: TextDirection.ltr,
    )..layout();
    textPainter
      ..paint(
        canvas,
        Offset(radius * 1.05 - textPainter.width / 2, -textPainter.height / 2),
      );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
