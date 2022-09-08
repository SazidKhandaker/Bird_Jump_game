import 'package:flutter/material.dart';

class Bird extends StatelessWidget {
  final birdYaxis;
  Bird({required this.birdYaxis});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0, birdYaxis),
      child: Image.asset(
        'assets/angry-bird-icon.png',
        width: 50,
      ),
    );
  }
}
