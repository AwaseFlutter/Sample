abstract class SignInRepository {
  Future<void> signInWithGoogle();

  Future<void> signInAnonymously();
}
