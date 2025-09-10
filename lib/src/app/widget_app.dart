import 'package:flutter/material.dart';
import 'package:vagaja/src/app/routes_app.dart';
import 'package:vagaja/src/services/auth_service.dart';
import 'package:vagaja/src/views/driver_login.dart';
import 'package:vagaja/src/views/driver_register.dart';
import 'package:vagaja/src/views/info_park.dart';
import 'package:vagaja/src/views/recover_password.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "VagaJá",
      // /home
      initialRoute: AuthService.isLoggedIn ? "/maps" : "/login",
      routes: {
        '/login' : (context) => const DriverLogin(),
        '/cadastro' : (context) => const DriverRegister(),
        '/recuperar_senha' : (context) => const RecoverPassword(),
        '/informacao_estacionamento' : (context) => infoPark(estacionamento: null,),
        ...generateRoutes()
      },

    );
  }
}