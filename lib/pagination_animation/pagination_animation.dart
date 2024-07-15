import 'package:flutter/material.dart';
import 'package:flutter_animation/messenger_chat_bubbles/constants/app_constants.dart';
import 'package:flutter_animation/pagination_animation/constants/color_constants.dart';

class PaginationAnimation extends StatefulWidget {
  const PaginationAnimation({super.key});

  @override
  State<PaginationAnimation> createState() => _PaginationAnimationState();
}

class _PaginationAnimationState extends State<PaginationAnimation> {
  /// This variable holds the new value of the operation
  ///
  int _counter = 0;

  /// This variable holds the old value of the operation
  ///
  int? _prevCounter = 0;

  /// This is a boolean variable that let's us perform a reverse/forward
  /// animation according to the operation made [increment - decrement]
  bool _isIncremented = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          "Pagination Animation",
          style: TextStyle(
            color: paginationBgColor,
          ),
        ),
      ),
      body: Container(
        color: paginationBgColor,
        alignment: Alignment.center,
        child: Container(
          decoration: BoxDecoration(
            color: paginationGreyColor,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  hoverColor: paginationBlackColor,
                  style: ButtonStyle(
                    padding: padding,
                    backgroundColor: paginationColor,
                  ),
                  onPressed: () {
                    // decrement
                    _prevCounter = _counter;
                    setState(() {
                      _counter--;
                      _isIncremented = false;
                    });
                  },
                  icon: const Icon(Icons.arrow_back_sharp),
                ),
                const SizedBox(width: 15),
                TweenAnimationBuilder<double>(
                  key: UniqueKey(),
                  duration: kDuration,
                  tween: Tween(begin: 0.0, end: 1.0),
                  builder: (context, value, child) {
                    /// This variable holds the position of the first [Text] in the stack
                    /// remember Stack are LIFD (Last In First Display) so we are saying if
                    /// the operation is an increment minus [5] from the animation value and
                    /// whatever the answer is add it to the position of the widget and the
                    /// Y index (Vertically) [The result is going to be negative, which
                    /// means the movement is going up] and if the the operation is a
                    /// decrement add [10] to the animation value and add the result to the
                    /// position of the widget in this case the value will be a positive
                    /// value which means the movement will be going down]
                    ///
                    final position1 =
                        _isIncremented ? (5 - value) : (10 + value);

                    /// This variable holds the position of the last [Text] in the stack
                    /// remember Stack are LIFD (Last In First Display) so we are saying if
                    /// the operation is an increment minus [5] from the animation value and
                    /// whatever the answer is add it to the position of the widget and the
                    /// Y index (Vertically) [The result is going to be negative, which
                    /// means the movement is going up] and if the the operation is a
                    /// decrement add [10] to the animation value and add the result to the
                    /// position of the widget in this case the value will be a positive
                    /// value which means the movement will be going down]
                    ///
                    final position2 =
                        _isIncremented ? (-5 * (1 - value)) : (5 * (1 - value));
                    return Stack(
                      children: [
                        if (_prevCounter != null)
                          Opacity(
                            opacity: 1 - value,
                            child: Transform.translate(
                              offset: Offset(0, position1),
                              child: Text(
                                "$_prevCounter",
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: paginationBlackColor,
                                ),
                              ),
                            ),
                          ),
                        Transform.translate(
                          offset: Offset(0, position2),
                          child: Text(
                            "$_counter",
                            style: TextStyle(
                              fontSize: 17 * value,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
                const SizedBox(width: 10),
                const Text(
                  "of 15",
                  style: TextStyle(
                    fontSize: 17,
                    color: paginationBlackColor,
                  ),
                ),
                const SizedBox(width: 15),
                IconButton(
                  hoverColor: paginationBlackColor,
                  style: ButtonStyle(
                    padding: padding,
                    backgroundColor: paginationColor,
                  ),
                  onPressed: () {
                    // increment
                    _prevCounter = _counter;
                    setState(() {
                      _counter++;
                      _isIncremented = true;
                    });
                  },
                  icon: const Icon(Icons.arrow_forward_sharp),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
