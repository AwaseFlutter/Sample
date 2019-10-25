import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sample_app/blocs/sign_in/sign_in_repository.dart';

class FirebaseSignInRepository extends SignInRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  FirebaseSignInRepository(
      {FirebaseAuth firebaseAuth, GoogleSignIn googleSignIn})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn();

  @override
  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await _firebaseAuth.signInWithCredential(credential);
  }

  @override
  Future<void> signInAnonymously() async {
    await _firebaseAuth.signInAnonymously();
  }
}
