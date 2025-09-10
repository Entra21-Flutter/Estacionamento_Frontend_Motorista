import 'package:flutter/material.dart';
import 'package:vagaja/src/controllers/register_controller.dart';
import 'package:vagaja/src/layouts/Input.dart';
import 'package:vagaja/src/services/auth_service.dart';

// Tela de cadastro de motorista, usando um StatefulWidget para gerenciar o estado dos campos do formulário.
class DriverRegister extends StatefulWidget {
  const DriverRegister({super.key});
  @override
  State<DriverRegister> createState() => _DriverRegisterState();
}

class _DriverRegisterState extends State<DriverRegister> {
  // Chave global para identificar o formulário e validar seus campos.
  final _formKey = GlobalKey<FormState>();

  // Controladores para capturar o texto digitado nos campos do formulário.
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmarSenhaController = TextEditingController();
  String mensagem = "";

   void _handleLogin() async{
    if (AuthService.isLoggedIn) {
      Navigator.pushReplacementNamed(context, "/home");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Padding(
        padding: const EdgeInsets.all(1),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // Inserindo figura aprimorada da logo
                  Image.asset("assets/images/novologovagaja3.png", height: 100),
                  // Inserindo figura aprimorada do banner
                  Image.asset(
                    "assets/images/novobannervagaja6.png",
                    height: 60,
                  ),
                  // Título estilizado com menos espaço acima
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18.0, top: 8.0),
                    child: Text(
                      'Cadastro',
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
                        RegisterController validarCadastroController =
                            RegisterController(
                              _nomeController,
                              _emailController,
                              _cpfController,
                              _senhaController,
                              _confirmarSenhaController,
                            );
                        mensagem = validarCadastroController.validarCadastro();
                        _handleLogin();
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
