import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sample_app/models/current_user.dart';

@immutable
abstract class AuthenticationState extends Equatable {
  AuthenticationState([List props = const []]) : super(props);
}

class AuthenticationInProgress extends AuthenticationState {
  @override
  String toString() => 'Uninitialized';
}

class AuthenticationSuccess extends AuthenticationState {
  final CurrentUser currentUser;

  AuthenticationSuccess(this.currentUser) : super([currentUser]);

  @override
  String toString() => 'AuthenticationSuccess';
}

class AuthenticationFailure extends AuthenticationState {
  @override
  String toString() => 'AuthenticationFailure';
}
