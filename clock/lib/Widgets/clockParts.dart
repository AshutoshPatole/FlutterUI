import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterclock/Config/Data_config.dart';

class ClockParts extends CustomPainter {
  final paintRight = Paint()
    ..color = taichiTheme[theme.lightTheme]
    ..style = PaintingStyle.fill;

  final paintLeft = Paint()
    ..color = taichiTheme[theme.darkTheme]
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final radius = min(size.width, size.height) * 0.2;

    var taiChiPathRight = Path();

    canvas.translate(centerX, centerY);
    canvas.rotate(pi / 3);

    taiChiPathRight.addArc(
        Rect.fromCircle(center: Offset(0, -radius), radius: radius),
        pi / 2,
        pi);
    taiChiPathRight.arcTo(
        Rect.fromCircle(center: Offset(0, radius), radius: radius),
        pi / 2,
        -pi,
        true);
    taiChiPathRight.addArc(
        Rect.fromCircle(center: Offset(0, 0), radius: radius * 2), -pi / 2, pi);
    var path = Path.combine(
        PathOperation.difference,
        taiChiPathRight,
        Path()
          ..addArc(Rect.fromCircle(center: Offset(0, radius), radius: radius),
              -pi / 2, pi));
    canvas.drawPath(path, paintRight);

    canvas.rotate(pi);
    canvas.drawPath(path, paintLeft);

    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
