import 'package:flutter/material.dart';
import 'package:flutter_animation/football_pitch_painter/pitch_custom_painter.dart';
import 'package:flutter_animation/football_pitch_painter/constants/football_pitch_colors.dart';

class FootballPitch extends StatelessWidget {
  const FootballPitch({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: const Color(0xff1B1E25),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width,
            height: orientation == Orientation.portrait ? height / 3 : height,
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
                      height: orientation == Orientation.portrait
                          ? height / 3
                          : height,
                      decoration: BoxDecoration(
                        color:
                            (index % 2 == 0) ? darkFieldColor : lightFieldColor,
                        border: Border.all(
                          color: (index % 2 == 0)
                              ? darkFieldColor
                              : lightFieldColor,
                        ),
                      ),
                    );
                  },
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: CustomPaint(
                      size: Size(
                          (width - 10),
                          ((orientation == Orientation.portrait
                                  ? height / 3
                                  : height) -
                              10)),
                      painter: PitchPainter(),
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
                              color: whiteFieldColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Container(
                              width: 1,
                              height: 20,
                              color: whiteFieldColor,
                            ),
                          ),
                          const Text(
                            "87:16",
                            style: TextStyle(
                              fontSize: 12,
                              color: whiteFieldColor,
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
