import 'package:flutter/material.dart';
import 'package:vagaja/src/app/routes_app.dart';
import 'package:vagaja/src/services/auth_service.dart';
import 'package:vagaja/src/views/login_view.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "VagaJá",
      initialRoute: AuthService.isLoggedIn ? '/home' : '/login',
      routes: {
        '/login' : (context) => const LoginView(),
        ...generateRoutes()
      },
    );
  }
}