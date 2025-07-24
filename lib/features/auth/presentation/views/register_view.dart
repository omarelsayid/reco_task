import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reco_task/core/services/injectable_services.dart';
import 'package:reco_task/features/auth/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:reco_task/features/auth/presentation/views/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: BlocProvider(
        create: (context) => getIt.get<RegisterCubit>(),
        child: const RegisterViewBody(),
      ),
    );
  }
}
