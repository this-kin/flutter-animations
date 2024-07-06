import 'dart:math' show pi;

import 'package:flutter/material.dart';
import 'package:flutter_animation/football_pitch_painter/constants/football_pitch_colors.dart';

class PitchPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 1
      ..color = lineFieldColor
      ..style = PaintingStyle.stroke;

    Paint filledPaint = Paint()
      ..strokeWidth = 1
      ..color = lineFieldColor
      ..style = PaintingStyle.fill;

    /// This is the field border
    /// The white  rectangle line of the field border
    ///
    const startPoint = Offset(0, 0);
    Offset endPoint = Offset(size.width, size.height);
    Rect rect = Rect.fromPoints(startPoint, endPoint);
    canvas.drawRect(rect, paint);

    /// This is the field middle straight line
    /// This is the line that divides the field into
    /// two equal sqare
    Offset midPoint1 = Offset(size.width / 2, 0);
    Offset midPoint2 = Offset(size.width / 2, size.height);
    canvas.drawLine(midPoint1, midPoint2, paint);

    /// This is the field middle circle
    ///
    double midCircleRadius = size.height * 0.2;
    Offset midCirlce = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(midCirlce, midCircleRadius, paint);

    /// This is the field middle inner small circle
    /// I think this represents a ball or something
    ///
    double smallCircleRadius = size.height * 0.013;
    Offset midInnerCircle = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(midInnerCircle, smallCircleRadius, filledPaint);

    /// This is home team Goal post
    ///
    Offset homeGoalStart = Offset(-3, size.height * 0.45);
    Offset homeGoalEnd = Offset(-3, size.height * 0.55);
    Rect homeGoalRect = Rect.fromPoints(homeGoalStart, homeGoalEnd);
    canvas.drawRect(homeGoalRect, paint);

    Offset homeInnerStartPoint = Offset(0, size.height * 0.40);
    Offset homeInnerEndPoint = Offset(size.width * 0.05, size.height * 0.60);
    Rect homeInnerRect =
        Rect.fromPoints(homeInnerStartPoint, homeInnerEndPoint);
    canvas.drawRect(homeInnerRect, paint);

    Offset homeOuterStartPoint = Offset(0, size.height * 0.25);
    Offset homeOuterEndPoint = Offset(size.width * 0.12, size.height * 0.75);
    Rect homeOuterRect =
        Rect.fromPoints(homeOuterStartPoint, homeOuterEndPoint);
    canvas.drawRect(homeOuterRect, paint);

    /// This is the small circle that is in the box 18
    /// for home team
    Offset homeInnerCircle = Offset(size.width * 0.09, size.height * 0.50);
    canvas.drawCircle(homeInnerCircle, smallCircleRadius, filledPaint);

    /// This is the arc of the home team goal post
    ///
    Offset homeArcStart = Offset(size.width * 0.10, size.height * 0.40);
    Offset homeArcEnd = Offset(size.width * 0.15, size.height * 0.60);
    Rect homeArc = Rect.fromPoints(homeArcStart, homeArcEnd);
    canvas.drawArc(homeArc, (pi / 2), -pi, false, paint);

    /// This is home team Goal post
    ///
    Offset awayGoalStart = Offset(size.width + 3, size.height * 0.45);
    Offset awayGoalEnd = Offset(size.width + 3, size.height * 0.55);
    Rect awayGoalRect = Rect.fromPoints(awayGoalStart, awayGoalEnd);
    canvas.drawRect(awayGoalRect, paint);

    Offset awayInnerStartPoint = Offset(size.width, size.height * 0.40);
    Offset awayInnerEndPoint =
        Offset(size.width - (size.width * 0.06), size.height * 0.60);
    Rect awayInnerRect =
        Rect.fromPoints(awayInnerStartPoint, awayInnerEndPoint);
    canvas.drawRect(awayInnerRect, paint);

    Offset awayOuterStartPoint = Offset(size.width, size.height * 0.25);
    Offset awayOuterEndPoint =
        Offset(size.width - (size.width * 0.12), size.height * 0.75);
    Rect awayOuterRect =
        Rect.fromPoints(awayOuterStartPoint, awayOuterEndPoint);
    canvas.drawRect(awayOuterRect, paint);

    Offset awayArcStart =
        Offset(size.width - (size.width * 0.10), size.height * 0.40);
    Offset awayArcEnd =
        Offset(size.width - (size.width * 0.15), size.height * 0.60);
    Rect awayArc = Rect.fromPoints(awayArcStart, awayArcEnd);
    canvas.drawArc(awayArc, -(pi / 2), -pi, false, paint);

    /// This is the small circle that is in the box 18
    /// for away team
    Offset awayInnerCircle =
        Offset(size.width - (size.width * 0.09), size.height * 0.50);
    canvas.drawCircle(awayInnerCircle, smallCircleRadius, filledPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
