import 'package:flutter/material.dart';

class LittleRoot extends StatelessWidget {
  const LittleRoot({this.x, this.y, this.currentMap, super.key});

  final dynamic x;
  final dynamic y;
  final dynamic currentMap;

  @override
  Widget build(BuildContext context) {
    if (currentMap == 'littleroot') {
      return Container(
        alignment: Alignment(x, y),
        child: Image.asset(
          'lib/images/littleroot.png',
          width: MediaQuery.of(context).size.width *
              0.85, // currently works with 0.85
          fit: BoxFit.cover,
        ),
      );
    } else {
      return Container();
    }
  }
}
