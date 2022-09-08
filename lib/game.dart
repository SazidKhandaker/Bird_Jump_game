import 'dart:async';

import 'package:floppybird/Bird.dart';
import 'package:floppybird/mycontainer.dart';

import 'package:flutter/material.dart';

class game extends StatefulWidget {
  const game({Key? key}) : super(key: key);

  @override
  State<game> createState() => _gameState();
}

class _gameState extends State<game> {
  static double birdYaxis = 0;
  double intitialposition = birdYaxis;
  double height = 0;
  double velocity = 3;
  double time = 0;
  double gravety = -4.9;
  bool gamestarted = false;
  static double Xaxis = 1;
  static double Xaxis2 = Xaxis + 3.0;

  void Startgame() {
    gamestarted = true;
    Timer.periodic(Duration(milliseconds: 28), (timer) {
      time += 0.005;
      height = gravety * time * time + velocity * time;
      setState(() {
        birdYaxis = intitialposition - height;
      });
      setState(() {
        if (Xaxis < -2) {
          Xaxis += 5;
        } else {
          Xaxis -= 0.1;
        }
      });
      setState(() {
        if (Xaxis2 < -2) {
          Xaxis2 += 5;
        } else {
          Xaxis2 -= 0.1;
        }
      });

      if (BirdIdead()) {
        timer.cancel();
        gamestarted = false;
      }
      //print(birdYaxis);
      time += 0.01;
    });
  }

  void birdjump() {
    setState(() {
      time = 0;
      intitialposition = birdYaxis;
    });
  }

  bool BirdIdead() {
    if (birdYaxis > 1 || birdYaxis < -1) {
      return true;
    } else
      return false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GestureDetector(
      onTap: gamestarted ? birdjump : Startgame,
      child: Scaffold(
        body: Column(children: [
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.blueGrey,
              child: Center(
                  child: Stack(
                children: <Widget>[
                  Bird(birdYaxis: birdYaxis),
                  Container(
                    alignment: Alignment(0, -0.5),
                    child: Text(
                      gamestarted ? '' : 'Tap to start',
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(Xaxis2, -1.1),
                    duration: Duration(milliseconds: 0),
                    child: mycontainer(Size: 180.0),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(Xaxis2, 1.1),
                    duration: Duration(milliseconds: 0),
                    child: mycontainer(Size: 180.0),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(Xaxis, 1.5),
                    duration: Duration(milliseconds: 0),
                    child: mycontainer(Size: 280.0),
                  ),
                  AnimatedContainer(
                    alignment: Alignment(Xaxis, -1.5),
                    duration: Duration(milliseconds: 0),
                    child: mycontainer(Size: 200.0),
                  ),
                ],
              )),
            ),
          ),
          Container(
            height: 8,
            width: double.infinity,
            color: Colors.green,
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.brown,
            ),
          )
        ]),
      ),
    ));
  }
}
