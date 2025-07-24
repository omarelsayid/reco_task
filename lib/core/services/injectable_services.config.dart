// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/repos/auth_repo.dart' as _i507;
import '../../features/auth/data/repos/auth_repo_imp.dart' as _i97;
import '../../features/auth/presentation/cubits/login_cubit/login_cubit.dart'
    as _i314;
import '../../features/auth/presentation/cubits/register_cubit/register_cubit.dart'
    as _i590;
import 'firebase_auth_service.dart' as _i5;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i5.FirebaseAuthService>(() => _i5.FirebaseAuthService());
    gh.factory<_i507.AuthRepo>(
      () => _i97.AuthRepoImp(gh<_i5.FirebaseAuthService>()),
    );
    gh.factory<_i314.LoginCubit>(() => _i314.LoginCubit(gh<_i507.AuthRepo>()));
    gh.factory<_i590.RegisterCubit>(
      () => _i590.RegisterCubit(gh<_i507.AuthRepo>()),
    );
    return this;
  }
}
