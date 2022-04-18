import 'package:f_firebase_202210/ui/firebase_cental.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/configutarion.dart';
import 'controllers/authentication_controller.dart';
import 'controllers/chat_controller.dart';
import 'controllers/firestore_controller.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(FirestoreController());
    Get.put(ChatController());
    Get.put(AuthenticationController());

    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Firebase demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const FirebaseCentral());
  }
}
