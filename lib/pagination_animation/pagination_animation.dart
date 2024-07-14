import 'package:flutter/material.dart';
import 'package:flutter_animation/messenger_chat_bubbles/constants/app_constants.dart';
import 'package:flutter_animation/pagination_animation/constants/color_constants.dart';

class PaginationAnimation extends StatefulWidget {
  const PaginationAnimation({super.key});

  @override
  State<PaginationAnimation> createState() => _PaginationAnimationState();
}

class _PaginationAnimationState extends State<PaginationAnimation> {
  ///
  int _counter = 0;

  int? _prevCounter = 0;

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
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    hoverColor: Colors.black,
                    style: ButtonStyle(
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(15)),
                      backgroundColor:
                          MaterialStateProperty.all(paginationBgColor),
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
                      final position1 =
                          _isIncremented ? (5 - value) : (10 + value);
                      final position2 = _isIncremented
                          ? (-5 * (1 - value))
                          : (5 * (1 - value));
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
                                    color: Colors.black,
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
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 15),
                  IconButton(
                    hoverColor: Colors.black,
                    style: ButtonStyle(
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(15)),
                      backgroundColor:
                          MaterialStateProperty.all(paginationBgColor),
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
            )),
      ),
    );
  }
}

/* 
,*/
