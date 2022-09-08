import 'package:flutter/material.dart';

class mycontainer extends StatelessWidget {
  final double Size;
  mycontainer({required this.Size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: Size,
      decoration: BoxDecoration(
        color: Colors.greenAccent,
        border: Border.all(width: 12, color: Colors.black),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
