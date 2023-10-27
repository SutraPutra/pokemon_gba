import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProfOak extends StatelessWidget {
  double x;
  double y;
  String location;
  String oakDirection;

  double height = 30.0;

  ProfOak({
    required this.x,
    required this.y,
    required this.location,
    required this.oakDirection,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // debug test
    // print('current location: $location');

    if (location == 'littleroot') {
      // ignore: sized_box_for_whitespace
      return Container(
        alignment: Alignment(x, y),
        child: Image.asset(
          'lib/images/oak$oakDirection.png',
          width: MediaQuery.of(context).size.width * 0.85,
          // fit: BoxFit.contain,
        ),
      );
    } else {
      return Container();
    }
  }
}
