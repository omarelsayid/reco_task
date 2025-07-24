import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:reco_task/core/utils/result.dart';
import 'package:reco_task/features/auth/data/repos/auth_repo.dart';
import 'package:reco_task/features/auth/presentation/cubits/login_cubit/login_states.dart';

@injectable
class LoginCubit extends Cubit<LoginStates> {
  final AuthRepo _authRepo;

  LoginCubit(this._authRepo) : super(LoginInitial());

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    final Result<UserCredential> result = await _authRepo.login(
      email,
      password,
    );
    switch (result) {
      case Success():
        emit(LoginSuccess(result.data!));
        break;
      case Error():
        emit(LoginError(result.exception.toString()));
        break;
    }
  }
}
