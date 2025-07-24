import 'package:firebase_auth/firebase_auth.dart';

sealed class RegisterStates {}

class RegisterInitial extends RegisterStates {}

class RegisterLoading extends RegisterStates {}

class RegisterSuccess extends RegisterStates {
  final UserCredential userCredential;
  RegisterSuccess(this.userCredential);
}

class RegisterError extends RegisterStates {
  final String error;
  RegisterError(this.error);
}
