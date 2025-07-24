import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reco_task/core/routes/routes_generator.dart';
import 'package:reco_task/core/services/custom_bloc_observer.dart';
import 'package:reco_task/core/services/injectable_services.dart';
import 'package:reco_task/core/utils/theming.dart';
import 'package:reco_task/features/auth/presentation/views/register_view.dart';
import 'package:reco_task/features/menu/presentation/views/menu_view.dart';
import 'package:reco_task/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  configureDependencies(); // Important to await this

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeData(),
      onGenerateRoute: RoutesGenerator.onGenerateRoute,
      home: FirebaseAuth.instance.currentUser != null
          ? const MenuView()
          : const RegisterView(),
    );
  }
}
