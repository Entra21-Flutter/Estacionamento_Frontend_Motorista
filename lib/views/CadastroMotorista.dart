import 'package:flutter/material.dart';
import 'package:vagaja/Controllers/LoginController.dart';
import 'package:vagaja/Controllers/CadastroController.dart';
import 'package:vagaja/views/layouts/BarraLogo.dart';
import 'package:vagaja/views/layouts/Input.dart';

// Tela de cadastro de motorista, usando um StatefulWidget para gerenciar o estado dos campos do formulário.
class CadastroMotorista extends StatefulWidget {
  const CadastroMotorista({super.key});
  @override
  State<CadastroMotorista> createState() => _CadastroMotoristaState();
}

class _CadastroMotoristaState extends State<CadastroMotorista> {
  // Chave global para identificar o formulário e validar seus campos.
  final _formKey = GlobalKey<FormState>();

  // Controladores para capturar o texto digitado nos campos do formulário.
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmarSenhaController =
      TextEditingController();
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
                      'Cadastro Motorista',
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
                  Input('Nome Completo', Icons.person, false, _nomeController),
                  Input('CPF', Icons.credit_card, false, _cpfController),
                  Input('E-mail', Icons.email, false, _emailController),
                  Input('Senha', Icons.lock, true, _senhaController),
                  Input(
                    'Confirmar Senha',
                    Icons.lock_outline,
                    true,
                    _confirmarSenhaController,
                  ),

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
                        CadastroController validarCadastroController =
                            CadastroController(
                              _nomeController,
                              _emailController,
                              _cpfController,
                              _senhaController,
                              _confirmarSenhaController,
                            );
                        String mensagem = validarCadastroController
                            .validarCadastro();
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(mensagem)));
                      },
                      child: const Text(
                        'Cadastrar',
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
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                        child: const Text('Já tem uma conta? Faça login'),
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
