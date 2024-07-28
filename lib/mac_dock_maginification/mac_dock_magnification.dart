import 'package:flutter/material.dart';
import 'package:flutter_animation/mac_dock_maginification/constants/app_constant.dart';

class MacDockMagnification extends StatefulWidget {
  const MacDockMagnification({super.key});

  @override
  State<MacDockMagnification> createState() => _MacDockMagnificationState();
}

class _MacDockMagnificationState extends State<MacDockMagnification> {
  // default size of the container (width & height)
  final double _kSize = 50;

  // default radius of the container widget
  final double _kRadius = 6;

  // tracks if pointer on widget (APP)
  bool _isSelected = false;

  // tracks current index (POSITION) of our selected widget (APP)
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Container(
              height: _kSize + 15,
              width: _kSize * 8,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xffC5C5C5).withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Center(
            child: Wrap(
              spacing: 12,
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.center,
              children: List.generate(6, (index) {
                // if mouse is hovered on widget and the
                // compare index with the selected widget index
                final isSelected = (_isSelected && index == _selectedIndex);
                return MouseRegion(
                  onEnter: (event) {
                    // if mouse is on top of widget set
                    // selected to true and get selected index
                    setState(() {
                      _isSelected = true;
                      _selectedIndex = index;
                      debugPrint('index: $index');
                    });
                  },
                  onExit: (event) {
                    // if mouse is moved away from widget set
                    // selected to false and set selected index to null
                    setState(() {
                      _isSelected = false;
                      _selectedIndex = null;
                      debugPrint('index: $index');
                    });
                  },
                  child: AnimatedContainer(
                    duration: kDuration,
                    alignment: Alignment.center,
                    transformAlignment: Alignment.center,
                    // if all conditions are met increase the width value by 2
                    // (_kSize * 2) else set to default size value (_kSize) (TENARY OPERATOR)
                    width: isSelected ? (_kSize * 2) : _kSize,

                    // if all conditions are met increase the height value by 2
                    // (_kSize * 2) else set to default size value (_kSize) (TENARY OPERATOR)
                    height: isSelected ? (_kSize * 2) : _kSize,
                    decoration: BoxDecoration(
                      color: Colors.black,

                      // if all conditions are met increase the radius value by 2
                      // (_kSize * 2) else set to default size value (_kSize) (TENARY OPERATOR)
                      borderRadius: BorderRadius.circular(
                          _isSelected ? _kRadius * 2 : _kRadius),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
