// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:payx/components/ShowHide.dart';
import 'package:themed/themed.dart';

class BankCard extends StatefulWidget {
  const BankCard(this.cardNumber,
      {required this.bankName, required this.bankLogoUrl});

  final String cardNumber;
  final String bankName;
  final String bankLogoUrl;

  @override
  State<StatefulWidget> createState() => BankCardState();
}

class BankCardState extends State<BankCard> {
  bool isShowing = false;

  @override
  Widget build(BuildContext context) {
    Container standardBankLogo = Container(
      width: 137,
      height: 51,
      child: ChangeColors(
          saturation: -1,
          brightness: 100,
          child: Image.network(widget.bankLogoUrl)),
    );

    ShowHide showHideToggle = ShowHide(
        isShowing: this.isShowing,
        onShow: () {
          setState(() {});
          this.isShowing = true;
        },
        onHide: () {
          setState(() {});
          this.isShowing = false;
        });

    return Container(
      height: 160,
      decoration: BoxDecoration(
          color: const Color(0xff474751),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Color(0xff000000).withOpacity(0.25),
                blurRadius: 4,
                offset: Offset(0, 4))
          ]),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16,
              ),
              standardBankLogo,
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    showHideToggle.isShowing
                        ? widget.cardNumber
                        : "${widget.cardNumber.substring(0, 4)}*********",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        foreground: Paint()..color = Colors.white),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  showHideToggle
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    widget.bankName,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        foreground: Paint()..color = Colors.white),
                  ),
                ],
              )
            ],
          ),
          Positioned(
            top: -56,
            left: -4,
            child: Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  border: Border.all(
                      color: Color(0xffCCCCCC),
                      style: BorderStyle.solid,
                      width: 2)),
            ),
          ),
          Positioned(
            top: 112,
            left: 223,
            child: Container(
              width: 123,
              height: 123,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  border: Border.all(
                      color: Color(0xffCCCCCC),
                      style: BorderStyle.solid,
                      width: 2)),
            ),
          ),
          Positioned(
            top: 69,
            left: 291,
            child: Container(
              width: 86,
              height: 86,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  border: Border.all(
                      color: Color(0xffCCCCCC),
                      style: BorderStyle.solid,
                      width: 2)),
            ),
          )
        ],
      ),
    );
  }
}
