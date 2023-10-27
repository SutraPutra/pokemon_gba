import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyBoy extends StatelessWidget {
  int boySpriteCount;
  final String direction;
  final String location;

  double height = 10.0;

  MyBoy({
    required this.direction,
    required this.boySpriteCount,
    required this.location,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // debug test
    // print('current location: $location');

    if (location == 'littleroot') {
      height = 30.0;
    }

    if (location == 'pokelab') {
      height = 36.0;
    } //else if (location == 'battleground' ||
    //     location == 'attackoptions' ||
    //     location == 'battlefinishedscreen') {
    //   height = 0;
    // }

    // ignore: sized_box_for_whitespace
    return Container(
      height: height,
      child: Image.asset(
        'lib/images/boy$direction$boySpriteCount.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
