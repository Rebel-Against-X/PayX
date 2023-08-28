// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:payx/components/BankCard.dart';
import 'package:payx/components/GradientText.dart';
import 'package:payx/components/shapes/Circle.dart';
import 'package:payx/components/shapes/Line.dart';

class Home extends StatelessWidget {
  const Home(this.user, {super.key});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        decoration: BoxDecoration(color: Color(0xff5E82CA)),
        child: ListView(
          children: [
            Column(
              children: [
                _HelloSection(),
                SizedBox(
                  height: 26,
                ),
                _ToolBar(),
                SizedBox(
                  height: 26,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(24, 0, 24, 0),
                  padding: EdgeInsets.all(16),
                  height: 312,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Danh sách bạn bè",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                foreground: Paint()..color = Color(0xff505050)),
                          ),
                          Image(image: AssetImage("assets/add_friend.png"))
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Line(),
                      SizedBox(
                        height: 7,
                      ),
                      Container(
                        height: 240,
                        child: ListView(
                          children: [
                            buildFriendBadge("PHẠM THIÊN PHONG", "0932232711"),
                            SizedBox(
                              height: 12,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 26,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  static Widget buildFriendBadge(String displayName, String phoneNumber) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Circle(
              width: 40,
              height: 40,
            ),
            SizedBox(
              width: 12,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  displayName,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      foreground: Paint()..color = Color(0xff363636)),
                ),
                Text(
                  phoneNumber,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      foreground: Paint()..color = Color(0xff363636)),
                )
              ],
            )
          ],
        ),
        Image(image: AssetImage("assets/dots.png"))
      ],
    );
  }

  Widget buildTool(String icon, String name) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: 28,
            width: 28,
            child: Image(image: AssetImage("assets/${icon}"))),
        Text(
          name,
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              foreground: Paint()..color = Color(0xff505050)),
        )
      ],
    );
  }

  // ======================= WIDGET SECTION START ========================

  Stack _HelloSection() {
    return Stack(
      children: [
        Container(
          height: 285,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
        ),
        Column(
          children: [
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(24, 0, 24, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GradientText(
                          "PAYX",
                          gradient: LinearGradient(
                              colors: [Color(0xff5E82CA), Color(0xff76ADE2)]),
                          style:
                              TextStyle(fontFamily: 'LCKTitle', fontSize: 16),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Xin chào, ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      foreground: Paint()
                                        ..color = Color(0xff818283)),
                                ),
                                GradientText(
                                    user.displayName != null
                                        ? user.displayName!
                                        : user.email!,
                                    gradient: LinearGradient(colors: [
                                      Color(0xff5E82CA),
                                      Color(0xff76ADE2)
                                    ]),
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    )),
                              ],
                            ),
                            Image(image: AssetImage("assets/user.png")),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(24, 0, 24, 0),
              child: BankCard("0787097309",
                  bankName: "MB Bank - Ngân hàng TMCP Quân đội",
                  bankLogoUrl: "https://api.vietqr.io/img/MB.png"),
            ),
          ],
        )
      ],
    );
  }

  Container _ToolBar() {
    return Container(
      margin: EdgeInsets.fromLTRB(24, 0, 24, 0),
      height: 80,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildTool("qrscan.png", "Quét mã"),
          buildTool("money.png", "Chia tiền"),
          buildTool("bank_card.png", "Quản lý thẻ"),
          buildTool("clock.png", "Lịch sử")
        ],
      ),
    );
  }
}
