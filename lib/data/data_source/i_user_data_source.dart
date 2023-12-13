import '../model/app_user.dart';

abstract class IUserDataSource {
  Future<void> createUser(email, uid);
  Stream<List<AppUser>> getUsers();
}
