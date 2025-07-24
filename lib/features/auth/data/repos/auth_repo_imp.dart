import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:reco_task/core/services/firebase_auth_service.dart';
import 'package:reco_task/core/utils/result.dart';
import 'package:reco_task/features/auth/data/repos/auth_repo.dart';

@Injectable(as: AuthRepo)
class AuthRepoImp implements AuthRepo {
  final FirebaseAuthService _firebaseAuthService;
  const AuthRepoImp(this._firebaseAuthService);

  @override
  Future<Result<UserCredential>> login(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuthService
          .signInWithEmailAndPassword(email: email, password: password);
      return Success(userCredential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Error('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        return Error('Wrong email or password.');
      } else if (e.code ==
          'The supplied auth credential is incorrect, malformed or has expired') {
        return Error('incorrect email or password.');
      } else {
        log(e.toString());
        return Error('Authentication error: ${e.message}');
      }
    } catch (e) {
      return Error('Unexpected error: ${e.toString()}');
    }
  }

  @override
  Future<Result<UserCredential>> register(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuthService
          .signUpWithEmailAndPassword(email: email, password: password);
      return Success(userCredential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Error('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return Error('The account already exists for that email.');
      } else {
        return Error('Authentication error: ${e.message}');
      }
    } catch (e) {
      return Error('Unexpected error: ${e.toString()}');
    }
  }
}
