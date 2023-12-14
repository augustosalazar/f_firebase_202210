import 'package:f_firebase_202210/domain/use_cases/authentication_use_case.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  AuthenticationUseCase authenticationUseCase = Get.find();

  Future<void> login(email, password) async =>
      authenticationUseCase.login(email, password);

  Future<void> signup(email, password) async =>
      authenticationUseCase.signup(email, password);

  Future<void> logout() async => authenticationUseCase.signOut();

  String userEmail() => authenticationUseCase.userEmail();

  String getUid() => authenticationUseCase.getUid();
}
