import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        ElevatedButton(onPressed: null, child: Text("Login")),
        ElevatedButton(onPressed: null, child: Text("Sign in")),
      ]),
    );
  }
}