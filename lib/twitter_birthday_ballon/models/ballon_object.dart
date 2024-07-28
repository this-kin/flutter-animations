import 'dart:math';

import 'package:flutter/material.dart';

class Ballon {
  late double x;
  late double y;
  late Color color;
  late double size;
  late double velocity;
  late double position;

  Ballon(Color ballonColor, double ballonSize, random) {
    velocity = 2;
    size = ballonSize;
    color = ballonColor;
    position = random;
  }

  void draw(Canvas canvas, Size canvasSize, value) {
    Paint paint1 = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    x = (canvasSize.width - size) * position;
    y = canvasSize.height;
    y = y - ((y / 2) * position);
    final speed = velocity * (sin(value) * velocity);

    if (y != canvasSize.height && x != canvasSize.width) {
      y = y - (y * speed);

      Offset c1 = Offset(x, y);
      canvas.drawCircle(c1, size, paint1);
    } else {}
  }
}
