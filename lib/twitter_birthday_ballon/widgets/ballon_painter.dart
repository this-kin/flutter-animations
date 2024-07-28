import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animation/twitter_birthday_ballon/models/ballon_object.dart';

class BallonPainter extends CustomPainter {
  final double value;
  final List<Ballon> ballons;

  BallonPainter({
    required this.value,
    required this.ballons,
  });

  @override
  void paint(Canvas canvas, Size size) {
    debugPrint("rebuilding custom painter");
    for (var i in ballons) {
      i.draw(canvas, size, value);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
