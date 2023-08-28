// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  Line({this.color = Colors.black26});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      decoration: BoxDecoration(
        color: this.color,
      ),
    );
  }
}
