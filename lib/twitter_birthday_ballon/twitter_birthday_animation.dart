import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_animation/twitter_birthday_ballon/models/ballon_object.dart';
import 'package:flutter_animation/twitter_birthday_ballon/widgets/ballon_painter.dart';

class BirthdayAnimation extends StatefulWidget {
  const BirthdayAnimation({super.key});

  @override
  State<BirthdayAnimation> createState() => _BirthdayAnimationState();
}

class _BirthdayAnimationState extends State<BirthdayAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation _animation;

  /// This variable holds the number of ballons to be created
  /// you can modify value number of choice.
  final _maxBallons = 10;

  /// This is a list that holds the  ballons created.
  List<Ballon> ballons = [];

  /// This is a list that holds the ballon colors variations.
  List<Color> colors = [];

  /// This is the maxium size of ballon.
  final ballonSize = 100.0;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    /// Adding desired Colors for my Ballon.
    colors.addAll([
      Colors.lightBlueAccent,
      Colors.purpleAccent,
      Colors.pinkAccent,
      Colors.greenAccent,
    ]);

    /// delete all existing Ballons on initialization.
    ballons.clear();

    /// While nimbers of Ballons created is less than max number of Ballon
    /// To be created, add a created Ballon.
    while (ballons.length < _maxBallons) {
      ///
      /// Generate a random number from the list of Colors.
      final random1 = Random().nextInt(colors.length - 1);

      /// A new instance of Color created from the random value.
      final random2 = Random().nextDouble();

      /// An instance of Ballon Object with random color and size.
      Ballon ballon = Ballon(colors[random1], ballonSize, random2);
      ballons.add(ballon);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          "Birthday Animation",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Stack(
                children: [
                  Center(
                    child: !_controller.isAnimating
                        ? TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  WidgetStateProperty.all(Colors.blueAccent),
                            ),
                            onPressed: () {
                              //  start animation
                              _controller
                                ..forward()
                                ..addStatusListener((status) {
                                  if (status == AnimationStatus.completed) {
                                    _controller.reset();
                                  }
                                });

                              setState(() {});
                            },
                            child: const Text(
                              "Celebrate",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomPaint(
                      size: size,
                      foregroundPainter: BallonPainter(
                        ballons: ballons,
                        value: _animation.value,
                      ),
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
