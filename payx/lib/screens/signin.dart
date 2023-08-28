// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:payx/components/BankCard.dart';
import 'package:payx/components/CartoonistButton.dart';
import 'package:payx/components/GradientText.dart';
import 'package:payx/components/ModernInput.dart';
import 'package:payx/screens/home.dart';
import 'package:payx/screens/signup.dart';

class SignIn extends StatelessWidget {
  String username;
  String password;

  SignIn({super.key, required this.username, required this.password});

  @override
  Widget build(BuildContext context) {
    ModernInput email =
        ModernInput("Email", style: TextStyle(fontFamily: 'Gilroy'));
    ModernInput password = ModernInput("Mật khẩu",
        inputType: InputType.PASSWORD, style: TextStyle(fontFamily: 'Gilroy'));

    return Scaffold(
      appBar: null,
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 74),
              GradientText(
                "PAYX",
                style: TextStyle(fontFamily: "LCKTitle", fontSize: 36),
                gradient: LinearGradient(
                    colors: [Color(0xff5E82CA), Color(0xff76ADE2)]),
              ),
              GradientText(
                "Smart Day. Smart Pay",
                style: TextStyle(
                  fontFamily: 'LCKTitle',
                  fontSize: 12,
                ),
                gradient: LinearGradient(
                    colors: [Color(0xff5E82CA), Color(0xff76ADE2)]),
              ),
              SizedBox(
                height: 64,
              ),
              Text(
                "ĐĂNG NHẬP",
                style: TextStyle(
                    fontFamily: 'Gilroy',
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    foreground: Paint()..color = Color(0xff5E82CA)),
              ),
              SizedBox(
                height: 16,
              ),
              email,
              SizedBox(
                height: 16,
              ),
              password,
              SizedBox(
                height: 26,
              ),
              CartoonistButton(
                "ĐĂNG NHẬP",
                onTap: () {
                  logIn(email.contentController.text,
                      password.contentController.text, context);
                },
              ),
              SizedBox(
                height: 21,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUp(),
                      ));
                },
                child: Text("Chưa có tài khoản? Đăng ký ngay.",
                    style: TextStyle(
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        foreground: Paint()..color = Color(0xff818283))),
              ),
              SizedBox(
                height: 21,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 1,
                    width: 217,
                    decoration: BoxDecoration(
                      color: Color(0xffBFC0C0),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    color: Colors.white,
                    child: Text(
                      "Hoặc tiếp tục với",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          foreground: Paint()..color = Color(0xffBFC0C0)),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 64,
                        height: 32,
                        decoration: BoxDecoration(
                          color: Color(0xffF4F4F4),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                      ),
                      Image(image: AssetImage("assets/google_icon.png")),
                    ],
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 64,
                        height: 32,
                        decoration: BoxDecoration(
                          color: Color(0xffF4F4F4),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                      ),
                      Image(image: AssetImage("assets/facebook_icon.png")),
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Future<void> logIn(
      String email, String password, BuildContext context) async {
    try {
      final User? value = (await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password))
          .user;
      if (value == null) throw Exception();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green[400],
          content:
              Text("Đăng nhập thành công bằng tài khoản ${value.displayName}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ))));
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => Home(value)));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red[400],
          content: Text(
              "Sai tên đăng nhập/mật khẩu. Nếu chưa có tài khoản, vui lòng đăng ký.",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ))));
    }
  }
}
