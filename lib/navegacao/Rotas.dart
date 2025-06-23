import 'package:flutter/material.dart';
import 'package:vagaja/Controllers/LoginController.dart';
import 'package:vagaja/views/CadastroMotorista.dart';
import 'package:vagaja/views/LoginMotorista.dart';
import 'package:vagaja/views/Principal.dart';

class Rotas extends StatelessWidget {
  // const Routes({super.key});

  LoginController loginController = LoginController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: loginController.getLoginValid()
          ? '/principal'
          : '/cadastro',
      routes: {
        '/principal': (context) => const Principal(),
        '/cadastro': (context) => const CadastroMotorista(),
        '/login': (context) => const LoginMotorista(),
        //'/recuperar-senha': (context) => const RecuperarSenha(),
      },
    );
  }
}
