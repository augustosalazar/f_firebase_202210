import 'package:f_firebase_202210/ui/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/app_user.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
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

  Widget _item(AppUser element, int posicion) {
    return Card(
      margin: const EdgeInsets.all(4.0),
      child: ListTile(
        title: Text(
          element.email,
        ),
      ),
    );
  }

  Widget _list() {
    return GetX<UserController>(builder: (controller) {
      return ListView.builder(
        itemCount: userController.users.length,
        itemBuilder: (context, index) {
          var element = userController.users[index];
          return _item(element, index);
        },
      );
    });
  }
}
