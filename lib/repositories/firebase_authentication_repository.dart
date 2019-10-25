import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sample_app/blocs/authentication/authentication_repository.dart';
import 'package:sample_app/models/current_user.dart';

class FirebaseAuthenticationRepository extends AuthenticationRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  FirebaseAuthenticationRepository(
      {FirebaseAuth firebaseAuth, GoogleSignIn googleSignIn})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn();

  @override
  Future<CurrentUser> getCurrentUser() async {
    final currentUser = await _firebaseAuth.currentUser();
    return CurrentUser(
        id: currentUser.uid,
        name: currentUser.displayName ?? "",
        photoUrl: currentUser.photoUrl ?? "",
        isAnonymous: currentUser.isAnonymous,
        createdAt: DateTime.fromMillisecondsSinceEpoch(
            currentUser.metadata.creationTimestamp),
        updatedAt: DateTime.fromMillisecondsSinceEpoch(
            currentUser.metadata.lastSignInTimestamp));
  }

  @override
  Future<bool> isSignedIn() async {
    final currentUser = await _firebaseAuth.currentUser();
    return currentUser != null;
  }

  @override
  Future<void> signOut() {
    return Future.wait([_firebaseAuth.signOut(), _googleSignIn.signOut()]);
  }
}
