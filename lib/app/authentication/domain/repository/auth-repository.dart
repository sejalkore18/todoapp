abstract class AuthRepository {
  Future<void> userSignIn({
    required String email,
    required String password,
  });

  Future<void> signOut();

  Future<void> userSignUp({
    required String email,
    required String password,
  });

  bool checkUserSignInStatus();
}
