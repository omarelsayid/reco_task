import 'package:firebase_auth/firebase_auth.dart';

sealed class LoginStates {}

final class LoginInitial extends LoginStates {}

final class LoginLoading extends LoginStates {}

final class LoginSuccess extends LoginStates {
  final UserCredential userCredential;
  LoginSuccess(this.userCredential);
}

final class LoginError extends LoginStates {
  final String message;
  LoginError(this.message);
}
