// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class ModernInput extends StatelessWidget {
  ModernInput(this.text,
      {this.style = const TextStyle(fontFamily: 'Gilroy'),
      this.height = 50,
      this.enable = true,
      this.inputType = InputType.TEXT,
      this.margin = const EdgeInsets.fromLTRB(30, 16, 30, 0)});

  String text;
  TextStyle style;
  EdgeInsets margin = EdgeInsets.fromLTRB(30, 16, 30, 0);
  double height = 50;
  bool enable = true;
  InputType inputType = InputType.TEXT;

  final contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          TextField(
            controller: contentController,
            enabled: enable,
            obscureText: inputType == InputType.PASSWORD ? true : false,
            enableSuggestions: inputType == InputType.PASSWORD ? false : true,
            autocorrect: inputType == InputType.PASSWORD ? false : true,
            textAlign: TextAlign.left,
            textAlignVertical: TextAlignVertical.center,
            style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 16,
                foreground: Paint()..color = Color(0xff505050),
                fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff434343)),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffCBCBCB)),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
          ),
          Positioned(
            top: -10,
            left: 20,
            child: Container(
              decoration: BoxDecoration(color: Colors.white),
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Text(
                text,
                style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 16,
                  foreground: Paint()..color = Color(0xff818283),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum InputType { TEXT, PASSWORD }
