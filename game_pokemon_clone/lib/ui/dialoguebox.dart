import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DialogueBox extends StatelessWidget {
  bool chatStarted;

  DialogueBox({required this.chatStarted, super.key});

  @override
  Widget build(BuildContext context) {
    if (chatStarted == true) {
      return Container(
        color: Colors.amber[200],
        width: 350,
        height: 70,
        child: const Padding(
          padding: EdgeInsets.all(5.0),
          child: Text(
            "Success! \nDialogue box created!...",
            style: TextStyle(
              backgroundColor: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
