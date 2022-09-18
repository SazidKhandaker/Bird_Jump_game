import 'dart:async';
import 'package:floppybird/game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 10),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => game())));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 600,
          width: double.infinity,
          color: Colors.redAccent,
          child: //Image.asset('assets/floppy.png'),
              FlutterLogo(size: MediaQuery.of(context).size.height),
        ),
        SizedBox(
          height: 50,
        ),
        TextButton(
          onPressed: () {
            setState(
              () {
                MaterialPageRoute(builder: (context) => game());
              },
            );
          },
          child: Text('Start The Game'),
        ),
      ],
    );
  }
}
