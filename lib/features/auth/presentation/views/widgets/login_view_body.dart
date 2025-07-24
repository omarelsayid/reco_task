import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reco_task/core/routes/pages_routes.dart';
import 'package:reco_task/core/utils/extention.dart';
import 'package:reco_task/core/utils/show_snack_bar.dart';
import 'package:reco_task/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:reco_task/features/auth/presentation/cubits/login_cubit/login_states.dart';
import 'package:reco_task/features/auth/presentation/views/widgets/custom_elevated_button.dart';
import 'package:reco_task/features/auth/presentation/views/widgets/donot_have_an_account.dart';
import 'package:reco_task/features/auth/presentation/views/widgets/field_lable.dart';
import 'package:reco_task/features/auth/presentation/views/widgets/welcome_widget.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: _autovalidateMode,
      key: _formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            const WelcomeWidget(
              title: 'Login Your Account',
              subtitle: 'To Explore the world exclusives',
            ),
            const SizedBox(height: 20),

            const FieldLabel(title: 'Email'),

            TextFormField(
              focusNode: _emailFocusNode,
              onFieldSubmitted: (value) => _passwordFocusNode.requestFocus(),
              autocorrect: true,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    'assets/icons/email.png',
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: emailFieldValidator,
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
            ),

            const SizedBox(height: 20),

            const FieldLabel(title: 'Password'),

            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    'assets/icons/password.png',
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
              focusNode: _passwordFocusNode,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: passwordValidatorTextField,
              controller: _passwordController,
              obscureText: true,
            ),
            const SizedBox(height: 30),

            BlocListener<LoginCubit, LoginStates>(
              listener: (context, state) {
                if (state is LoginLoading) {
                  isLoading = true;
                  setState(() {});
                } else if (state is LoginSuccess) {
                  isLoading = false;
                  showSuccessSnackBar('Login Successfully', context);
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    PagesRoutes.menu,
                    (_) => false,
                  );
                } else if (state is LoginError) {
                  isLoading = false;
                  setState(() {});
                  showErrorSnackBar(state.message, context);
                }
              },
              child: CustomElevatedButton(
                isLoading: isLoading,
                title: 'Sign In',
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await context.read<LoginCubit>().login(
                      _emailController.text,
                      _passwordController.text,
                    );
                  } else {
                    setState(() {});
                    _autovalidateMode = AutovalidateMode.onUserInteraction;
                  }
                },
              ),
            ),

            SizedBox(height: 20),
            DonotHaveAnAccountWidget(),
          ],
        ),
      ),
    );
  }

  String? emailFieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email.';
    } else if (!value.isValidEmail) {
      return 'Please enter a valid email address (e.g., user@example.com).';
    }
    return null;
  }

  String? passwordValidatorTextField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter password.';
    } else if (!value.isPasswordValid) {
      return 'Password must be at least 8 characters and include:\n'
          '- Uppercase letter\n'
          '- Lowercase letter\n'
          '- Number\n'
          '- Special character (!@#\$&*~)';
    }
    return null;
  }
}
