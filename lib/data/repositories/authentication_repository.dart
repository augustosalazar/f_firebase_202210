import 'package:f_firebase_202210/data/data_source/i_user_data_source.dart';

import '../../domain/repositories/i_authentication_repository.dart';
import '../data_source/i_authentication_data_source.dart';

class AuthenticationRepository implements IAuthenticationRepository {
  final IAuthenticationDataSource _authenticationDataSource;
  final IUserDataSource _userDataSource;

  AuthenticationRepository(
      this._authenticationDataSource, this._userDataSource);

  @override
  String getUid() => _authenticationDataSource.getUid();

  @override
  Future<void> signIn(String email, String password) async {
    final uid = await _authenticationDataSource.signIn(email, password);
    await _userDataSource.createUser(email, uid);
  }

  @override
  Future<void> signOut() async => await _authenticationDataSource.signOut();

  @override
  String userEmail() => _authenticationDataSource.userEmail();

  @override
  Future<void> login(String email, String password) =>
      _authenticationDataSource.login(email, password);
}
