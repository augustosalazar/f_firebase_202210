import 'dart:async';
import 'package:f_firebase_202210/domain/use_cases/user_use_case.dart';
import 'package:f_firebase_202210/ui/controllers/authentication_controller.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import '../../data/model/app_user.dart';

class UserController extends GetxController {
  UserUsecase userUseCase = Get.find();
  final _users = <AppUser>[].obs;
  late StreamSubscription<List<AppUser>> streamSubscription;

  get users {
    AuthenticationController authenticationController = Get.find();
    return _users
        .where((entry) => entry.uid != authenticationController.getUid())
        .toList();
  }

  get allUsers => _users;

  void start() {
    _users.clear();

    streamSubscription = userUseCase.getUsers().listen((event) {
      logInfo(
          "got new list of messages from firebase of length ${event.length}");
      _users.value = event;
    });
  }

  void stop() {
    streamSubscription.cancel();
  }

  // this should never be called
  Future<void> createUser(email, uid) async =>
      await userUseCase.createUser(email, uid);
}
