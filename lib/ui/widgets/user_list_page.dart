import 'package:f_firebase_202210/ui/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/app_user.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({Key? key}) : super(key: key);

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  UserController userController = Get.find();

  @override
  void initState() {
    userController.start();
    super.initState();
  }

  @override
  void dispose() {
    userController.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _list();
  }

  Widget _item(AppUser element) {
    return Card(
      margin: const EdgeInsets.all(4.0),
      child: ListTile(
        title: Text(
          element.email,
        ),
        subtitle: Text(element.uid),
      ),
    );
  }

  Widget _list() {
    return GetX<UserController>(builder: (controller) {
      if (userController.users.length == 0) {
        return const Center(
          child: Text('No users'),
        );
      }
      return ListView.builder(
        itemCount: userController.users.length,
        itemBuilder: (context, index) {
          var element = userController.users[index];
          return _item(element);
        },
      );
    });
  }
}
