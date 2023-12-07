import 'package:f_firebase_202210/data/data_source/firestore_chat_data_source.dart';
import 'package:f_firebase_202210/data/data_source/i_chat_data_source.dart';
import 'package:f_firebase_202210/domain/repositories/i_chat_reposity.dart';
import 'package:f_firebase_202210/domain/use_cases/chat_use_case.dart';
import 'package:f_firebase_202210/ui/firebase_cental.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/repositories/chat_reposity.dart';
import 'controllers/authentication_controller.dart';
import 'controllers/chat_controller.dart';
import 'controllers/user_controller.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Get.put<IChatDataSource>(FirebaseRealTimeDatabaseDataSource());
    Get.put<IChatDataSource>(FirestoreChatDataSource());
    Get.put<IChatRepository>(ChatRepository(Get.find()));
    Get.put(ChatUseCase(Get.find()));

    Get.put(ChatController());
    Get.put(AuthenticationController());
    Get.put(UserController());

    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Firebase demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const FirebaseCentral());
  }
}
