import 'package:flutter/material.dart';

class ShowHide extends StatefulWidget {
  ShowHide(
      {super.key,
      required this.onShow,
      required this.onHide,
      this.width = 18,
      this.height = 12,
      this.isShowing = false});

  final Function() onShow;
  final Function() onHide;

  double width = 18, height = 12;

  bool isShowing = false;

  @override
  State<StatefulWidget> createState() => ShowHideState();
}

class ShowHideState extends State<ShowHide> {
  bool toggle() {
    bool newState = !widget.isShowing;
    setState(() {
      widget.isShowing = newState;
    });
    return newState;
  }

  @override
  Widget build(BuildContext context) {
    print("call build(): ${widget.isShowing}");
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: GestureDetector(
        onTap: () {
          bool newState = toggle();
          if (newState) {
            widget.onShow.call();
          } else {
            widget.onHide.call();
          }
        },
        child: Image(
            image: widget.isShowing
                ? const AssetImage("assets/show.png")
                : const AssetImage("assets/hide.png")),
      ),
    );
  }
}
