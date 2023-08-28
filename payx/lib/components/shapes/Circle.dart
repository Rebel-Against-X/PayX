import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  Circle(
      {required this.width, required this.height, this.color = Colors.black38});

  final double width, height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}
