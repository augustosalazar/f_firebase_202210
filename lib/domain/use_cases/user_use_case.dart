import '../../data/model/app_user.dart';
import '../repositories/i_user_repository.dart';

class UserUsecase {
  IUserRepository userRepository;
  UserUsecase(this.userRepository);
  Stream<List<AppUser>> getUsers() {
    return userRepository.getUsers();
  }

  Future<void> createUser(email, uid) async {
    return await userRepository.createUser(email, uid);
  }
}
