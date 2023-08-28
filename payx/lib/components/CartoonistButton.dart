import 'package:flutter/material.dart';
import 'package:payx/utilities/ColorUtils.dart';

class CartoonistButton extends StatefulWidget {
  CartoonistButton(this.text,
      {required this.onTap,
      this.width = 200,
      this.height = 50,
      this.buttonState = ButtonState.NORMAL});

  Color color = Color(0xff5E82CA);
  String text = "ĐĂNG NHẬP";

  double width = 200, height = 50;
  ButtonState buttonState = ButtonState.NORMAL;

  void Function()? onTap;

  @override
  State<CartoonistButton> createState() => CartoonistButtonState();
}

class CartoonistButtonState extends State<CartoonistButton> {
  setButtonState(ButtonState newState) {
    setState(() {
      widget.buttonState = newState;
    });
  }

  final snackBar = SnackBar(
    content: Text("yey"),
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (tapDetail) {
        if (widget.buttonState == ButtonState.DISABLED) return;

        if (widget.buttonState == ButtonState.NORMAL) {
          setButtonState(ButtonState.PRESSED);

          if (widget.onTap != null) widget.onTap?.call();
        }
      },
      onTapUp: (tapDetail) {
        if (widget.buttonState == ButtonState.DISABLED) return;

        if (widget.buttonState == ButtonState.PRESSED) {
          setButtonState(ButtonState.NORMAL);
        }
      },
      child: Container(
        width: widget.width,
        child: Stack(
          children: [
            Container(
              height: widget.height,
              decoration: BoxDecoration(
                  color: ColorUtils.darken(
                    widget.color,
                    0.2,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            Container(
              height: widget.height - 5,
              decoration: BoxDecoration(
                  color: widget.buttonState == ButtonState.NORMAL
                      ? widget.color
                      : ColorUtils.darken(
                          widget.color,
                          0.2,
                        ),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            Container(
              alignment: Alignment.center,
              height: widget.height,
              child: Text(widget.text,
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      foreground: Paint()..color = Colors.white,
                      fontSize: 20)),
            )
          ],
        ),
      ),
    );
  }
}

enum ButtonState { NORMAL, PRESSED, DISABLED }
