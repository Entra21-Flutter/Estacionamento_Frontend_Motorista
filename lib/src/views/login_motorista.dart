import 'package:flutter/material.dart';
import 'package:vagaja/src/controllers/login_controller.dart';

import 'package:vagaja/src/layouts/barra_logo.dart';
import 'package:vagaja/src/layouts/input.dart';

class LoginMotorista extends StatefulWidget {
  const LoginMotorista({super.key});

  @override
  State<LoginMotorista> createState() => _LoginMotoristaState();
}

class _LoginMotoristaState extends State<LoginMotorista> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      // Barra superior da tela com o título.
      appBar: Barralogo(),

      // ...existing code...
      body: Padding(
        padding: const EdgeInsets.all(1),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
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
                      onPressed: () {
                        ValidarLoginController validarLoginController =
                            ValidarLoginController(
                              _emailController,
                              _senhaController,
                            );
                        String mensagem = validarLoginController.validarLogin();
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(mensagem)));
                      },
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
                            '/recuperar-senha',
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
    );
  }
}
