import '../../data/model/app_user.dart';

abstract class IUserRepository {
  Future<void> createUser(email, uid);
  Stream<List<AppUser>> getUsers();
}
