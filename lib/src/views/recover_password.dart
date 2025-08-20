import 'package:flutter/material.dart';
import 'package:vagaja/src/controllers/recover_password_controller.dart';
import 'package:vagaja/src/layouts/Input.dart';
import 'package:vagaja/src/layouts/logo_bar.dart';

class RecoverPassword extends StatefulWidget {
  const RecoverPassword({super.key});

  @override
  State<RecoverPassword> createState() => _RecoverPasswordState();
}

class _RecoverPasswordState extends State<RecoverPassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      // Barra superior da tela com o título.
      appBar: Barralogo(),

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
                      'Recuperar Senha',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        letterSpacing: 1.2,
                        shadows: [
                          Shadow(
                            blurRadius: 4,
                            color: Colors.black12,
                            offset: Offset(1, 1),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // Inputs
                  Input('E-mail', Icons.email, false, _emailController),

                 
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
                        RecoverPasswordController recuperarSenhaController =
                            RecoverPasswordController(_emailController);
                        String mensagem = recuperarSenhaController
                            .enviarEmail();
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(mensagem)));
                      },
                      child: const Text(
                        'Continuar',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                  // Separação vertical para opções de recuperação e login
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                        child: const Text(
                          'Você já possui uma conta? Faça login!',
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
