import 'package:f_firebase_202210/data/data_source/i_user_data_source.dart';
import 'package:f_firebase_202210/data/model/app_user.dart';
import 'package:f_firebase_202210/domain/repositories/i_user_repository.dart';

class UserRepostiory implements IUserRepository {
  IUserDataSource userDataSource;
  UserRepostiory(this.userDataSource);
  @override
  Future<void> createUser(email, uid) async =>
      userDataSource.createUser(email, uid);

  @override
  Stream<List<AppUser>> getUsers() => userDataSource.getUsers();
}
