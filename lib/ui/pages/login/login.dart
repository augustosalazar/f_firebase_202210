import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/authentication_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final AuthenticationController authenticationController = Get.find();

  void signIn() async {
    await authenticationController.signup('a@a.com', '123456');
    await authenticationController.signup('b@b.com', '123456');
    await authenticationController.signup('c@c.com', '123456');
  }

  void login(user) {
    authenticationController.login(user, '123456');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () => login('a@a.com'),
                    child: const Text("Login with a@a.com")),
                ElevatedButton(
                    onPressed: () => login('b@b.com'),
                    child: const Text("Login with b@b.com")),
                ElevatedButton(
                    onPressed: () => login('c@c.com'),
                    child: const Text("Login with c@c.com")),
                ElevatedButton(onPressed: signIn, child: const Text("Sign in")),
              ]),
        ),
      ),
    );
  }
}
