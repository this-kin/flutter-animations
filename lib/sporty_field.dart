import 'dart:math';

import 'package:flutter/material.dart';

class Sporty extends StatelessWidget {
  const Sporty({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xff1B1E25),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width,
            height: height / 3,
            child: Stack(
              fit: StackFit.expand,
              children: [
                ListView.builder(
                  itemCount: 15,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return Container(
                      width: width * 0.066,
                      height: height / 3,
                      decoration: BoxDecoration(
                        color: (index % 2 == 0)
                            ? _darkFieldColor
                            : _lightFieldColor,
                        border: Border.all(
                          color: (index % 2 == 0)
                              ? _darkFieldColor
                              : _lightFieldColor,
                        ),
                      ),
                    );
                  },
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: CustomPaint(
                      size: Size((width - 10), ((height / 3) - 10)),
                      painter: SportyFieldPainter(),
                    ),
                  ),
                ),
                Positioned(
                  top: 15,
                  left: width / 2 - 47,
                  right: width / 2 - 47,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 75,
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(color: Colors.black),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "2nd",
                            style: TextStyle(
                              fontSize: 12,
                              color: _whiteFieldColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Container(
                              width: 1,
                              height: 20,
                              color: _whiteFieldColor,
                            ),
                          ),
                          const Text(
                            "87:16",
                            style: TextStyle(
                              fontSize: 12,
                              color: _whiteFieldColor,
                              fontWeight: FontWeight.w800,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SportyFieldPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 1
      ..color = _lineFieldColor
      ..style = PaintingStyle.stroke;

    Paint filledPaint = Paint()
      ..strokeWidth = 1
      ..color = _lineFieldColor
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

const Color _lightFieldColor = Color(0xff228842);
const Color _darkFieldColor = Color(0xff147F35);
const Color _lineFieldColor = Color(0xff98CBA7);
const Color _whiteFieldColor = Color(0xffFFFFFF);
