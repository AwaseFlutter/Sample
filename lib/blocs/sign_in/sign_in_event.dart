import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SignInEvent extends Equatable {}

class SignInWithGoogleOnPressed extends SignInEvent {}

class SignInAnonymouslyOnPressed extends SignInEvent {}
