import 'package:flutter/material.dart';
import 'package:flutter_animation/messenger_chat_bubbles/constants/app_constants.dart';

class MessengerChat extends StatefulWidget {
  const MessengerChat({super.key});

  @override
  State<MessengerChat> createState() => _MessengerChatState();
}

class _MessengerChatState extends State<MessengerChat> {
  final GlobalKey _key = GlobalKey();

  Offset position = const Offset(0, 0);

  final GlobalKey _removeButton = GlobalKey();

  /// to track the current state of our widget whether
  /// it's been dragged or not it can either be true or false
  ///
  bool _isDragged = false;

  bool _isOverlayed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Messenger Chat Head",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const Center(
            child: Text("Lorem Ipsum"),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).size.height * 0.1,
            child: Visibility(
              key: _removeButton,
              visible: _isDragged,
              child: const Icon(
                size: 70,
                Icons.cancel_outlined,
                color: Colors.redAccent,
              ),
            ),
          ),
          AnimatedPositioned(
            duration: kDuration,
            left: position.dx,
            top: position.dy,
            child: GestureDetector(
              onPanEnd: (_) {
                /// on drag released we set the [isDragged] to false
                ///
                setState(() {
                  _isDragged = false;
                });
              },
              onPanUpdate: (details) {
                _isDragged = true;
                final size = _key.currentContext!.size;
                final dx = (details.globalPosition.dx - size!.width);
                final dy = (details.globalPosition.dy - size.height);
                setState(() {
                  position = Offset(dx, dy);
                });
                final renderBox =
                    _key.currentContext?.findRenderObject() as RenderBox;
                final offset = renderBox.localToGlobal(Offset.zero);
                final renderButton = _removeButton.currentContext
                    ?.findRenderObject() as RenderBox;
                final buttonOffset = renderButton.localToGlobal(Offset.zero);
                if (buttonOffset == offset) {
                  debugPrint("widgets are overlaying");
                }

                debugPrint("dx:$dx dy:$dy");
              },
              child: FloatingActionButton(
                key: _key,
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                onPressed: () {
                  late Offset offset;
                  final renderBox =
                      _key.currentContext?.findRenderObject() as RenderBox;
                  offset = renderBox.localToGlobal(Offset.zero);
                  debugPrint(" dx:${offset.dx} dy:${offset.dy}");
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
