import 'dart:async';

import 'package:flutter/material.dart';
import 'package:game_pokemon_clone/ui/button.dart';
import 'package:game_pokemon_clone/characters/boy.dart';
import 'package:game_pokemon_clone/maps/littleroot.dart';
import 'package:game_pokemon_clone/maps/pokelab.dart';
import 'package:game_pokemon_clone/characters/oak.dart';
import 'package:game_pokemon_clone/ui/dialoguebox.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //littleroot
  double mapX = 2.175;
  double mapY = 1.15;

  // pokelab
  double labMapX = 0;
  double labMapY = 0;

  // Main hero (boy) character
  int boySpriteCount = 0; // 0 for standing, 1-2 for walking
  String boyDirection = 'Down';
  String currentLocation = 'littleroot';
  double step = 0.475;

  // Professor Oak character
  String oakDirection = 'Down';
  // static const oakX = 0.125;
  // static const oakY = 0.9;
  bool chatStarted = false;
  // int countPressingA = -1;

  // no mans land for littleroot
  List<List<double>> noMansLandLittleroot = [
    // top left house
    [1.2249999999999996, 1.6250],
    [1.6999999999999997, 1.625],
    [1.6999999999999997, 2.1],
    [1.6999999999999997, 2.575],
    [1.6999999999999997, 3.0500000000000003],
    [1.6999999999999997, 3.5250000000000004],
    [2.175, 3.5250000000000004],
    [2.65, 3.5250000000000004],
    [3.125, 3.5250000000000004],
    [3.6, 3.0500000000000003],
    [3.6, 2.575],
    [3.6, 2.1],
    [3.6, 1.625],
    [3.125, 1.625],
    [2.65, 1.625],
    [2.175, 1.625],
    // top right house
    [-1.1500000000000004, 1.6249999999999996],
    [-1.6250000000000004, 1.6249999999999996],
    [-2.1000000000000005, 1.6249999999999996],
    [-2.5750000000000006, 1.6249999999999996],
    [-3.0500000000000007, 1.6249999999999996],
    [-3.525000000000001, 1.6249999999999996],
    [-3.525000000000001, 2.0999999999999996],
    [-3.525000000000001, 2.5749999999999997],
    [-3.525000000000001, 3.05],
    [-3.0500000000000007, 3.525],
    [-2.5750000000000006, 3.525],
    [-2.1000000000000005, 3.525],
    [-1.6250000000000004, 3.525],
    [-1.6250000000000004, 3.05],
    [-1.6250000000000004, 2.5749999999999997],
    [-1.6250000000000004, 2.0999999999999996],
    // town sign board
    [-2.5750000000000006, -0.7500000000000004],
    //bottom left house
    [3.125, -0.27500000000000047],
    [2.65, -0.27500000000000047],
    [2.175, -0.27500000000000047],
    [1.6999999999999997, -0.27500000000000047],
    [1.2249999999999996, -0.27500000000000047],
    [0.7499999999999997, -0.27500000000000047],
    [0.2749999999999997, -0.27500000000000047],
    [0.2749999999999997, -0.7500000000000004],
    [0.2749999999999997, -1.2250000000000005],
    [0.2749999999999997, -1.7000000000000006],
    [0.2749999999999997, -2.1750000000000007],
    [0.7499999999999997, -2.1750000000000007],
    [1.2249999999999996, -1.7000000000000002],
    [1.6999999999999997, -2.1750000000000007],
    [2.175, -2.1750000000000007],
    [2.65, -2.1750000000000007],
    [3.125, -2.1750000000000007],
    [3.125, -1.7000000000000006],
    [3.125, -1.2250000000000005],
    [3.125, -0.7500000000000006],
    [1.6999999999999997, -2.6500000000000012],
    // [1.6999999999999997, -2.6500000000000004],
    // forest boundary
    [5.0249999999999995, 1.15],
    [5.0249999999999995, 1.625],
    [5.0249999999999995, 2.1],
    [5.0249999999999995, 2.575],
    [5.0249999999999995, 3.0500000000000003],
    [5.0249999999999995, 3.5250000000000004],
    [5.0249999999999995, 4.0],
    [4.55, 4.0],
    [4.075, 4.0],
    [4.075, 4.475],
    [4.075, 4.949999999999999],
    [3.6, 4.949999999999999],
    [3.125, 4.949999999999999],
    [2.65, 4.949999999999999],
    [2.175, 4.949999999999999],
    [1.6999999999999997, 4.949999999999999],
    [1.2249999999999996, 4.949999999999999],
    [0.7499999999999997, 4.949999999999999],
    [0.2749999999999997, 4.949999999999999],
    [0.2749999999999997, 5.424999999999999],
    [5.0249999999999995, 0.674999999999999],
    [5.0249999999999995, 0.19999999999999907],
    [5.0249999999999995, -0.2750000000000009],
    [5.0249999999999995, -0.7500000000000009],
    [5.0249999999999995, -1.225000000000001],
    [5.0249999999999995, -1.700000000000001],
    [5.0249999999999995, -2.175000000000001],
    [5.0249999999999995, -2.6500000000000012],
    [5.0249999999999995, -3.1250000000000013],
    [4.55, -3.1250000000000013],
    [4.075, -3.1250000000000013],
    [4.075, -3.6000000000000014],
    [4.075, -4.075000000000001],
    [3.6, -4.075000000000001],
    [3.125, -4.075000000000001],
    [2.65, -4.075000000000001],
    [2.175, -4.075000000000001],
    [1.6999999999999997, -4.075000000000001],
    [1.2249999999999996, -4.075000000000001],
    [0.7499999999999997, -4.075000000000001],
    [0.2749999999999997, -4.075000000000001],
    [-0.2000000000000003, -4.075000000000001],
    [-0.6750000000000003, -4.075000000000001],
    [-1.1500000000000004, -4.075000000000001],
    [-1.6250000000000004, -4.075000000000001],
    [-2.1000000000000005, -4.075000000000001],
    [-2.5750000000000006, -4.075000000000001],
    [-3.0500000000000007, -4.075000000000001],
    [-3.0500000000000007, -3.600000000000001],
    [-3.0500000000000007, -3.125000000000001],
    [-3.525000000000001, -3.125000000000001],
    [-4.000000000000001, -3.125000000000001],
    [-4.000000000000001, -2.650000000000001],
    [-4.000000000000001, -2.1750000000000007],
    [-4.4750000000000005, -2.1750000000000007],
    [-4.95, -2.1750000000000007],
    [-4.95, -1.7000000000000006],
    [-4.95, -1.2250000000000005],
    [-4.95, -0.7500000000000006],
    [-4.95, -0.2750000000000006],
    [-4.95, 0.1999999999999994],
    [-4.95, 0.6749999999999994],
    [-4.95, 1.1499999999999995],
    [-4.95, 1.6249999999999996],
    [-4.95, 2.0999999999999996],
    [-4.95, 2.5749999999999997],
    [-4.95, 3.05],
    [-4.95, 3.525],
    [-4.95, 4.0],
    [-4.4750000000000005, 4.0],
    [-4.000000000000001, 4.0],
    [-4.000000000000001, 4.475],
    [-4.000000000000001, 4.949999999999999],
    [-3.525000000000001, 4.949999999999999],
    [-3.0500000000000007, 4.949999999999999],
    [-2.5750000000000006, 4.949999999999999],
    [-2.1000000000000005, 4.949999999999999],
    [-1.6250000000000004, 4.949999999999999],
    [-1.1500000000000004, 4.949999999999999],
    [-1.1500000000000004, 5.424999999999999],
    [0.2749999999999996, 5.424999999999999],
    [-0.2000000000000003, 5.899999999999999],
    [-0.6750000000000003, 5.899999999999999],
    // Prof oak positiion
    [-0.2000000000000003, 4.949999999999999],
  ];

  // no mans land for pokelab
  // more coordinates need to be added. only bottom line coordinates added.
  List<List<double>> noMansLandPokeLab = [
    [-5.225, -5.425],
    [-4.75, -5.425],
    [-4.275, -5.425],
    [-3.8000000000000003, -5.425],
    [-3.325, -5.425],
    [-2.85, -5.425],
    [-2.375, -5.425],
    [-1.9, -5.425],
    [-1.4249999999999998, -5.425],
    [0.4750000000000001, -5.425],
    [0.9500000000000001, -5.425],
    [1.425, -5.425],
    [1.9, -5.425],
    [2.375, -5.425],
    [2.85, -5.425],
    [3.325, -5.425],
    [3.8000000000000003, -5.425],
    [4.275, -5.425],
    [4.75, -5.425],
    [5.225, -5.425],
    [5.699999999999999, -5.425],
  ];

  void moveLeft() {
    boyDirection = 'Left';
    // no mans land for littleroot
    if (currentLocation == 'littleroot') {
      if (canMoveTo(boyDirection, noMansLandLittleroot, mapX, mapY)) {
        setState(() {
          mapX += step;
        });
      }
    } else if (currentLocation == 'pokelab') {
      if (canMoveTo(boyDirection, noMansLandPokeLab, labMapX, labMapY)) {
        setState(() {
          labMapX += step;
        });
      }
    }

    animateWalk();
  }

  void moveUp() {
    boyDirection = 'Up';
    if (currentLocation == 'littleroot') {
      // no mans land for littleroot
      if (canMoveTo(boyDirection, noMansLandLittleroot, mapX, mapY)) {
        setState(() {
          mapY += step;
        });

        // If boy moves up to the pokelab door, then change the location
        // couldn't use the double.parse.fixedasnum() here. hence directly used the mapX & mapY variables
        // but the direct approach also wasn't perfect.
        // hence use the cleanNum function to reduce everything down to 4 decimals & then it was perfect
        if (cleanNum(mapX) == cleanNum(1.2249999999999996) &&
            cleanNum(mapY) == cleanNum(-2.1750000000000003)) {
          setState(() {
            currentLocation = 'pokelab';
            labMapX = -0.475;
            labMapY = -4.95;
          });
        }

        // if boy moves up to prof oak, then he turns & dialogue/ fight starts
        if (cleanNum(mapX) == cleanNum(-0.6750000000000003) &&
            cleanNum(mapY) == cleanNum(4.949999999999999)) {
          setState(() {
            oakDirection = "Right";
            chatStarted = true;
          });
        }
      }
    } else if (currentLocation == 'pokelab') {
      if (canMoveTo(boyDirection, noMansLandPokeLab, labMapX, labMapY)) {
        setState(() {
          labMapY += step;
        });
      }
    }
    animateWalk();
  }

  void moveDown() {
    boyDirection = 'Down';
    // no mans land for littleroot
    if (currentLocation == 'littleroot') {
      if (canMoveTo(boyDirection, noMansLandLittleroot, mapX, mapY)) {
        setState(() {
          mapY -= step;
        });
      }
    } else if (currentLocation == 'pokelab') {
      if (canMoveTo(boyDirection, noMansLandPokeLab, labMapX, labMapY)) {
        setState(() {
          labMapY -= step;
        });

        // couldn't use the double.parse.fixedasnum() here. hence directly used the labmapX & labmapY variables
        if ((double.parse(labMapX.toStringAsFixed(3)) == -0.475 &&
                labMapY == -5.425) ||
            (double.parse(labMapX.toStringAsFixed(3)) == -0.95 &&
                labMapY == -5.425) ||
            (double.parse(labMapX.toStringAsFixed(3)) == 0.0 &&
                labMapY == -5.425)) {
          setState(() {
            currentLocation = 'littleroot';
            mapX = 1.2249999999999996;
            mapY = -2.6500000000000004;
          });
        }
      }
    }

    animateWalk();
  }

  void moveRight() {
    boyDirection = 'Right';
    // no mans land for littleroot
    if (currentLocation == 'littleroot') {
      if (canMoveTo(boyDirection, noMansLandLittleroot, mapX, mapY)) {
        setState(() {
          mapX -= step;
        });
      }
    } else if (currentLocation == 'pokelab') {
      if (canMoveTo(boyDirection, noMansLandPokeLab, labMapX, labMapY)) {
        setState(() {
          labMapX -= step;
        });
      }
    }
    animateWalk();
  }

  void pressedA() {}
  void pressedB() {}

  void animateWalk() {
    // Debug print testing
    print('LittleRootMap x, y: [$mapX, $mapY],');
    // print('PokeLabMap x, y: [$labMapX, $labMapY],');

    Timer.periodic(const Duration(milliseconds: 75), (timer) {
      setState(() {
        boySpriteCount++;
      });

      if (boySpriteCount == 3) {
        boySpriteCount = 0;
        timer.cancel();
      }
    });
  }

  double cleanNum(double num) {
    return double.parse(num.toStringAsFixed(4));
  }

  bool canMoveTo(String direction, var noMansLand, double x, double y) {
    double stepX = 0;
    double stepY = 0;

    if (direction == 'Left') {
      stepX = step;
      stepY = 0;
    } else if (direction == 'Right') {
      stepX = -step;
      stepY = 0;
    } else if (direction == 'Up') {
      stepX = 0;
      stepY = step;
    } else if (direction == 'Down') {
      stepX = 0;
      stepY = -step;
    }

    for (int i = 0; i < noMansLand.length; i++) {
      if ((cleanNum(noMansLand[i][0]) == cleanNum(x + stepX)) &&
          (cleanNum(noMansLand[i][1]) == cleanNum(y + stepY))) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // child 1
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              color: Colors.black,
              child: Stack(
                children: [
                  // Littleroot
                  LittleRoot(
                    x: mapX,
                    y: mapY,
                    currentMap: currentLocation,
                  ),

                  // PokeLab
                  MyPokeLab(
                    x: labMapX,
                    y: labMapY,
                    currentMap: currentLocation,
                  ),

                  // Prof Oak
                  Container(
                    alignment: const Alignment(0, 0),
                    child: ProfOak(
                        x: mapX,
                        y: mapY - 0.05,
                        location: currentLocation,
                        oakDirection: oakDirection),
                  ),

                  // boy
                  Container(
                    alignment: const Alignment(0, 0),
                    child: MyBoy(
                      boySpriteCount: boySpriteCount,
                      location: currentLocation,
                      direction: boyDirection,
                    ),
                  ),

                  // dialogue box

                  Container(
                    alignment: const Alignment(0, 1),
                    child: DialogueBox(chatStarted: chatStarted),
                  )
                ],
              ),
            ),
          ),

          // child 2
          Expanded(
            child: Container(
              color: Colors.grey[900],
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'G A M E B O Y',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          // '  ❤  ',
                          '  🔥  ',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'F L U T T E R',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Arrow keys
                        Row(
                          children: [
                            Column(
                              children: [
                                const SizedBox(
                                  height: 50,
                                  width: 50,
                                ),
                                MyButton(
                                  text: '◀',
                                  function: moveLeft,
                                ),
                                const SizedBox(
                                  height: 50,
                                  width: 50,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                MyButton(
                                  text: '️▲',
                                  function: moveUp,
                                ),
                                const SizedBox(
                                  height: 50,
                                  width: 50,
                                ),
                                MyButton(
                                  text: '️▼',
                                  function: moveDown,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const SizedBox(
                                  height: 50,
                                  width: 50,
                                ),
                                MyButton(
                                  text: '️▶',
                                  function: moveRight,
                                ),
                                const SizedBox(
                                  height: 50,
                                  width: 50,
                                ),
                              ],
                            ),
                          ],
                        ),

                        // A & B buttons
                        Row(
                          children: [
                            Column(
                              children: [
                                const SizedBox(
                                  height: 50,
                                  width: 50,
                                ),
                                MyButton(
                                  text: 'b',
                                  function: pressedB,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                MyButton(
                                  text: 'a',
                                  function: pressedA,
                                ),
                                const SizedBox(
                                  height: 50,
                                  width: 50,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'CREATED BY STRPTR',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
