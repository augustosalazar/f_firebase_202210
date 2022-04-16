import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/authentication_controller.dart';

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
                ElevatedButton(onPressed: login, child: const Text("Login")),
                ElevatedButton(onPressed: signIn, child: const Text("Sign in")),
              ]),
        ),
      ),
    );
  }
}
