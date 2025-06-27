import 'package:flutter/material.dart';


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
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200], // Cor de fundo da tela.
      // Barra superior da tela com o título.
      appBar: AppBar(title: const Text('Cadastro de Pessoa')),
      body: Padding(
        padding: const EdgeInsets.all(10.0), // Espaçamento interno da tela.
        child: Center(
          child: SingleChildScrollView(
            // Permite rolar a tela caso o teclado cubra os campos.
            child: Form(
              key: _formKey, // Associa o formulário à chave global.
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Campo para o nome completo.
                  TextFormField(
                    controller: _nomeController,
                    decoration: const InputDecoration(labelText: 'Nome completo'),
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Informe seu nome' : null,
                  ),
                  const SizedBox(height: 16), // Espaçamento vertical.

                  // Campo para CPF.
                  TextFormField(
                    controller: _cpfController,
                    decoration: const InputDecoration(labelText: 'CPF'),
                    keyboardType: TextInputType.number,
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Informe seu CPF' : null,
                  ),
                  const SizedBox(height: 16),

                  // Campo para e-mail.
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'E-mail'),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Informe seu e-mail' : null,
                  ),
                  const SizedBox(height: 16),

                  // Campo para senha.
                  TextFormField(
                    controller: _senhaController,
                    decoration: const InputDecoration(labelText: 'Senha'),
                    obscureText: true, // Oculta o texto digitado (senha).
                    validator: (value) =>
                        value == null || value.length < 6 ? 'Senha deve ter pelo menos 6 caracteres' : null,
                  ),
                  const SizedBox(height: 24),

                  // Botão de cadastro.
                  ElevatedButton(
                    onPressed: () {
                      // Valida todos os campos do formulário.
                      if (_formKey.currentState!.validate()) {
                        // Se todos os campos estiverem válidos, exibe uma mensagem de sucesso.
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Cadastro realizado!')),
                        );
                        // Aqui você pode adicionar a lógica de cadastro (ex: enviar dados para o backend).
                      }
                    },
                    child: const Text('Cadastrar'),
                  ),
                  const SizedBox(height: 24),

                  // Linha com opção para quem já tem conta.
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Já tem uma conta?'),
                      TextButton(
                        onPressed: () {
                          // Navega para a tela de login.
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                        child: const Text('Faça login'),
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