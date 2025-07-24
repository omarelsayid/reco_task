import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:reco_task/core/utils/result.dart';
import 'package:reco_task/features/auth/data/repos/auth_repo.dart';
import 'package:reco_task/features/auth/presentation/cubits/register_cubit/register_states.dart';

@injectable
class RegisterCubit extends Cubit<RegisterStates> {
  final AuthRepo _authRepo;
  RegisterCubit(this._authRepo) : super(RegisterInitial());

  Future<void> register(String email, String password) async {
    emit(RegisterLoading());
    final Result<UserCredential> result = await _authRepo.register(
      email,
      password,
    );
    switch (result) {
      case Success():
        emit(RegisterSuccess(result.data!));
        break;
      case Error():
        emit(RegisterError(result.exception.toString()));
        break;
    }
  }
  Future<void> login(String email, String password) async {
    emit(RegisterLoading());
    final Result<UserCredential> result = await _authRepo.login(
      email,
      password,
    );
    switch (result) {
      case Success():
        emit(RegisterSuccess(result.data!));
        break;
      case Error():
        emit(RegisterError(result.exception.toString()));
        break;
    }
  }
}
