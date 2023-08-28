// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:payx/components/CartoonistButton.dart';
import 'package:payx/components/ModernInput.dart';
import 'package:payx/utilities/SnackbarUtils.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    ModernInput email =
        ModernInput("Email", style: TextStyle(fontFamily: 'Gilroy'));
    ModernInput displayName =
        ModernInput("Họ và tên", style: TextStyle(fontFamily: 'Gilroy'));
    ModernInput phoneNumber =
        ModernInput("Số điện thoại", style: TextStyle(fontFamily: 'Gilroy'));
    ModernInput password = ModernInput(
      "Mật khẩu",
      style: TextStyle(fontFamily: 'Gilroy'),
      inputType: InputType.PASSWORD,
    );
    ModernInput rePassword = ModernInput("Nhập lại mật khẩu",
        style: TextStyle(fontFamily: 'Gilroy'), inputType: InputType.PASSWORD);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("ĐĂNG KÝ PAYX",
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 20,
                foreground: Paint()..color = Color(0xff5E82CA))),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 27,
              ),
              email,
              SizedBox(
                height: 16,
              ),
              displayName,
              SizedBox(
                height: 16,
              ),
              phoneNumber,
              SizedBox(
                height: 16,
              ),
              password,
              SizedBox(
                height: 16,
              ),
              rePassword,
              SizedBox(
                height: 25,
              ),
              CartoonistButton(
                "ĐĂNG KÝ",
                onTap: () {
                  RegExp phoneExp = RegExp("[0-9]{10}");

                  if (!phoneExp.hasMatch(phoneNumber.contentController.text)) {
                    SnackbarUtils.showSnackbar(SnackbarLevel.ERROR, context,
                        "Số điện thoại không hợp lệ.");
                    return;
                  }

                  if (password.contentController.text !=
                      rePassword.contentController.text) {
                    SnackbarUtils.showSnackbar(
                        SnackbarLevel.ERROR, context, "Mật khẩu không khớp.");
                    return;
                  }

                  if (displayName.contentController.text == "") {
                    SnackbarUtils.showSnackbar(SnackbarLevel.ERROR, context,
                        "Vui lòng điền đầy đủ họ và tên.");
                    return;
                  }

                  signUp(
                      email.contentController.text,
                      password.contentController.text,
                      displayName.contentController.text,
                      phoneNumber.contentController.text,
                      context);
                },
              ),
              SizedBox(
                height: 42,
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

  Future<void> signUp(String email, String password, String displayName,
      String phoneNumber, BuildContext context) async {
    try {
      final User? user = (await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password))
          .user;
      if (user == null) throw new Exception("user-null");
      user.updateDisplayName(displayName);
      SnackbarUtils.showSnackbar(SnackbarLevel.SUCCESS, context,
          "Tạo tài khoản thành công. Vui lòng quay trở về trang đăng nhập để tiến hành đăng nhập.");
    } catch (e) {
      if (e is FirebaseAuthException) {
        FirebaseAuthException exception = e;
        switch (exception.code) {
          case "email-already-in-use":
            SnackbarUtils.showSnackbar(SnackbarLevel.ERROR, context,
                "Email này đã được sử dụng bởi một tài khoản khác.");
            break;
          case "invalid-email":
            SnackbarUtils.showSnackbar(
                SnackbarLevel.ERROR, context, "Email không hợp lệ.");
            break;
          case "weak-password":
            SnackbarUtils.showSnackbar(SnackbarLevel.WARNING, context,
                "Mật khẩu hiện tại quá yếu. Vui lòng chọn một mật khẩu khác mạnh hơn.");
            break;
          case "user-null":
            SnackbarUtils.showSnackbar(SnackbarLevel.ERROR, context,
                "Không thể tạo tài khoản người dùng. Vui lòng thử lại sau.");
        }
      }
    }
  }
}
