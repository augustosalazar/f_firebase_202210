import '../../domain/repositories/i_authentication_repository.dart';
import '../data_source/i_authentication_data_source.dart';

class AuthenticationRepository implements IAuthenticationRepository {
  final IAuthenticationDataSource _authenticationDataSource;

  AuthenticationRepository(this._authenticationDataSource);

  @override
  String getUid() => _authenticationDataSource.getUid();

  @override
  Future<void> signIn(String email, String password) async =>
      await _authenticationDataSource.signIn(email, password);

  @override
  Future<void> signOut() async => await _authenticationDataSource.signOut();

  @override
  String userEmail() => _authenticationDataSource.userEmail();

  @override
  Future<void> login(String email, String password) =>
      _authenticationDataSource.login(email, password);
}
