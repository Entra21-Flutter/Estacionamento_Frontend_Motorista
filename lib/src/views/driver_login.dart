import 'package:flutter/material.dart';
import 'package:vagaja/src/controllers/login_controller.dart';

import 'package:vagaja/src/layouts/Input.dart';

class DriverLogin extends StatefulWidget {
  const DriverLogin({super.key});

  @override
  State<DriverLogin> createState() => _DriverLoginState();
}

class _DriverLoginState extends State<DriverLogin> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  
  void _handleLogin() async {
    ValidationLoginController validarLoginController =
        ValidationLoginController(
          _emailController, 
          _senhaController
          );    
    if (validarLoginController.validarLogin()) {
      validarLoginController.mostrarMensagem(context);
      Navigator.pushReplacementNamed(context, "/maps");
    }else{
      validarLoginController.mostrarMensagem(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.white],
          ),
        ),
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Inserindo figura aprimorada da logo
                  Image.asset("assets/images/novologovagaja3.png", height: 100),
                  // Inserindo figura aprimorada do banner
                  Image.asset(
                    "assets/images/novobannervagaja6.png",
                    height: 60,
                  ),
                  //inserindo espaço entre o banner e o enunciado de login
                  SizedBox(height: 30),
                  // Título estilizado com menos espaço acima
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18.0, top: 8.0),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        letterSpacing: 1.2,
                        shadows: [
                          Shadow(
                            blurRadius: 4,
                            color: Colors.black12,
                            offset: Offset(1, 2),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // Inputs
                  Input('E-mail', Icons.email, false, _emailController),
                  Input('Senha', Icons.lock, true, _senhaController),

                  // Botão de cadastro
                  const SizedBox(height: 18),
                  SizedBox(
                    width: 200,
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[800],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        elevation: 2,
                      ),
                      onPressed: () {_handleLogin();},
                      child: const Text(
                        'Entrar',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Separação vertical para opções de recuperação e login
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            '/recuperar_senha',
                          );
                        },
                        child: const Text('Esqueceu a senha?'),
                      ),

                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/cadastro');
                        },
                        child: const Text(
                          'Não possui uma conta? Cadastre uma agora!',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
    );
  }
}
