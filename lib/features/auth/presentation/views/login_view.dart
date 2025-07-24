import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reco_task/core/services/injectable_services.dart';
import 'package:reco_task/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:reco_task/features/auth/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: BlocProvider(
        create: (context) => getIt.get<LoginCubit>(),
        child: LoginViewBody()),
    );
  }
}
