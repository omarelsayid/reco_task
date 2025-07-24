import 'package:firebase_auth/firebase_auth.dart';
import 'package:reco_task/core/utils/result.dart';

abstract interface class AuthRepo {
  Future<Result<UserCredential>> login(String email, String password);
  Future<Result<UserCredential>> register(String email, String password);
}
