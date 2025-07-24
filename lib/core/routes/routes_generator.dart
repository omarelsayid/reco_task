import 'package:flutter/material.dart';
import 'package:reco_task/core/routes/pages_routes.dart';
import 'package:reco_task/features/auth/presentation/views/login_view.dart';
import 'package:reco_task/features/auth/presentation/views/register_view.dart';
import 'package:reco_task/features/menu/presentation/views/menu_view.dart';

class RoutesGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PagesRoutes.register:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case PagesRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case PagesRoutes.menu:
        return MaterialPageRoute(builder: (_) => const MenuView());
      default:
        return unDefinedRoute();
    }
  }
}

Route<dynamic> unDefinedRoute() {
  return MaterialPageRoute(
    builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Un defined route"),
          centerTitle: true,
        ),
        body: const Center(child: Text("Un defined route")),
      );
    },
  );
}
