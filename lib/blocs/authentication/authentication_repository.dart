import 'package:sample_app/models/current_user.dart';

abstract class AuthenticationRepository {
  Future<void> signOut();

  Future<bool> isSignedIn();

  Future<CurrentUser> getCurrentUser();
}
