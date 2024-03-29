abstract class IAuthenticationDataSource {
  Future<String> signIn(String email, String password);

  Future<void> signOut();

  String userEmail();

  String getUid();

  Future<void> login(String email, String password);
}
