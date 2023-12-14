import 'package:f_firebase_202210/data/data_source/firebase_authentication_data_source.dart';
import 'package:f_firebase_202210/data/data_source/firestore_chat_data_source.dart';
import 'package:f_firebase_202210/data/data_source/i_authentication_data_source.dart';
import 'package:f_firebase_202210/data/data_source/i_chat_data_source.dart';
import 'package:f_firebase_202210/data/data_source/i_user_data_source.dart';
import 'package:f_firebase_202210/domain/repositories/i_authentication_repository.dart';
import 'package:f_firebase_202210/domain/repositories/i_chat_reposity.dart';
import 'package:f_firebase_202210/domain/repositories/i_user_repository.dart';
import 'package:f_firebase_202210/domain/use_cases/authentication_use_case.dart';
import 'package:f_firebase_202210/domain/use_cases/chat_use_case.dart';
import 'package:f_firebase_202210/ui/firebase_cental.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/data_source/firebase_real_time_database_chat_data_source.dart';
import '../data/data_source/firebase_real_time_database_user_data_source.dart';
import '../data/repositories/authentication_repository.dart';
import '../data/repositories/chat_reposity.dart';
import '../data/repositories/user_repository.dart';
import '../domain/use_cases/user_use_case.dart';
import 'controllers/authentication_controller.dart';
import 'controllers/chat_controller.dart';
import 'controllers/user_controller.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put<IUserDataSource>(FirebaseRealTimeDatabaseUserDataSource());
    Get.put<IUserRepository>(UserRepostiory(Get.find()));
    Get.put(UserUsecase(Get.find()));
    Get.put(UserController());

    Get.put<IAuthenticationDataSource>(FirebaseAuthenticationDataSource());
    Get.put<IAuthenticationRepository>(
        AuthenticationRepository(Get.find(), Get.find()));
    Get.put(AuthenticationUseCase(Get.find()));
    Get.put(AuthenticationController());

    Get.put<IChatDataSource>(FirebaseRealTimeDatabaseChatDataSource());
    //Get.put<IChatDataSource>(FirestoreChatDataSource());
    Get.put<IChatRepository>(ChatRepository(Get.find()));
    Get.put(ChatUseCase(Get.find()));
    Get.put(ChatController());

    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Firebase demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const FirebaseCentral());
  }
}
