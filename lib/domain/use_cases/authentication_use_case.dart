import '../repositories/i_authentication_repository.dart';

class AuthenticationUseCase {
  final IAuthenticationRepository _authenticationRepository;

  AuthenticationUseCase(this._authenticationRepository);

  Future<void> login(String email, String password) async {
    return await _authenticationRepository.login(email, password);
  }

  Future<void> signup(email, password) async {
    return await _authenticationRepository.signIn(email, password);
  }

  Future<void> signOut() async {
    await _authenticationRepository.signOut();
  }

  String userEmail() {
    return _authenticationRepository.userEmail();
  }

  String getUid() {
    return _authenticationRepository.getUid();
  }
}
