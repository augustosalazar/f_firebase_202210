import 'package:f_firebase_202210/ui/widgets/firestore_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import '../controllers/authentication_controller.dart';
import '../widgets/chat_page.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({Key? key}) : super(key: key);

  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  int _selectIndex = 0;
  AuthenticationController authenticationController = Get.find();
  static final List<Widget> _widgets = <Widget>[
    const FireStorePage(),
    const ChatPage()
  ];

  _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  _logout() async {
    try {
      await authenticationController.logout();
    } catch (e) {
      logError(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Welcome ${authenticationController.userEmail()}"),
          actions: [
            IconButton(
                icon: const Icon(Icons.exit_to_app),
                onPressed: () {
                  _logout();
                }),
          ]),
      body: _widgets.elementAt(_selectIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Firestore"),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: "Chat")
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectIndex,
        iconSize: 40,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.amber[200],
        onTap: _onItemTapped,
      ),
    );
  }
}
