import 'package:flutter/material.dart';
import 'package:flutter_animation/messenger_chat_head/constants/app_constants.dart';

class MessengerChat extends StatefulWidget {
  const MessengerChat({super.key});

  @override
  State<MessengerChat> createState() => _MessengerChatState();
}

class _MessengerChatState extends State<MessengerChat> {
  final GlobalKey _key = GlobalKey();

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
          AnimatedPositioned(
            child: FloatingActionButton(
              key: _key,
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              onPressed: () {
                debugPrint(" ${_key}")
              },
            ),
            duration: kDuration,
          )
        ],
      ),
    );
  }
}
