import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import '../controllers/authentication_controller.dart';
import '../widgets/chat_page.dart';
import '../widgets/user_list_page.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({super.key});

  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  int _selectIndex = 0;
  AuthenticationController authenticationController = Get.find();
  static final List<Widget> _widgets = <Widget>[
    const ChatPage(),
    const UserListPage()
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
                icon: const Icon(
                  Icons.exit_to_app,
                  size: 30,
                ),
                onPressed: () {
                  _logout();
                }),
          ]),
      body: _widgets.elementAt(_selectIndex),
      bottomNavigationBar: CurvedNavigationBar(
        items: const <Widget>[
          Icon(
            Icons.home,
            size: 35,
            color: Colors.white,
          ),
          Icon(
            Icons.accessibility,
            size: 35,
            color: Colors.white,
          ),
        ],
        height: 60,
        letIndexChange: (index) => true,
        color: Theme.of(context).colorScheme.primary,
        buttonBackgroundColor: const Color(0xFFF6A641),
        backgroundColor: Colors.transparent.withOpacity(0),
        index: _selectIndex,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 170),
        onTap: _onItemTapped,
      ),
    );
  }
}
