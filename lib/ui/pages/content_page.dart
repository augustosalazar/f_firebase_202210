import 'package:f_firebase_202210/model/controllers/authentication_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContentPage extends StatelessWidget {
  const ContentPage({Key? key}) : super(key: key);

  logout() {
    AuthenticationController authenticationController = Get.find();
    authenticationController.logout();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: ElevatedButton(
        child: Text('Logout'),
        onPressed: logout,
      )),
    );
  }
}
