import 'package:flutter/material.dart';
import 'package:vagaja/Controllers/LoginController.dart';
import 'package:vagaja/views/CadastroMotorista.dart';

class Routes extends StatelessWidget {
  // const Routes({super.key});

  LoginController loginController = LoginController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: loginController.getLoginValid() ? '/home' : '/login',
      routes: {
        '/cadastro' : (context) => const CadastroMotorista(),
        // '/login' : (context) => const LoginMotorista(),
        // '/home' : (context) => const PaginaPrincipal(),

      },
    );
  }
}