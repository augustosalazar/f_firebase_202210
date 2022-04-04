import 'package:f_firebase_202210/model/controllers/authentication_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  AuthenticationController authenticationController = Get.find();

  void signIn() {
    authenticationController.signup('a@a.com', '123456');
  }

  void login() {
    authenticationController.login('a@a.com', '123456');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: login, child: Text("Login")),
                ElevatedButton(onPressed: signIn, child: Text("Sign in")),
              ]),
        ),
      ),
    );
  }
}
