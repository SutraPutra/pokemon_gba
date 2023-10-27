import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({this.text, this.function, super.key});

  // *****
  // Find a better alternative to using the dynamic type
  // for better code
  // *****
  final dynamic text;
  final dynamic function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              width: 1.0,
              color: Colors.white,
            ),
          ),
          height: 50,
          width: 50,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 22),
            ),
          ),
        ),
      ),
    );
  }
}
