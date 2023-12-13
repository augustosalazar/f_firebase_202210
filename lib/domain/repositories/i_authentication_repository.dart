import '../../data/data_source/i_authentication_data_source.dart';

abstract class IAuthenticationRepository {
  final IAuthenticationDataSource _authenticationDataSource;

  IAuthenticationRepository(this._authenticationDataSource);

  Future<void> signIn(String email, String password);

  Future<void> login(String email, String password);

  Future<void> signOut();

  String userEmail();

  String getUid();
}
