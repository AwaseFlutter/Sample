import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SignInState extends Equatable {}

class SignInEmpty extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {}

class SignInFailure extends SignInState {}
