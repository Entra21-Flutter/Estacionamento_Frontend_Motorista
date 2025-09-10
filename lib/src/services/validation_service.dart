import 'package:flutter/widgets.dart';
//essa classe deveria ser um service
class ValidationService {

  bool validarNomeCompleto(TextEditingController nomeController) {
    String nome = nomeController.text.trim();
    // Nome deve ter pelo menos 5 letras e não conter números
    if (nome.isEmpty || nome.length < 5 || RegExp(r'[0-9]').hasMatch(nome)) {
      return false;
    }
    return true;
  }

  bool validarCpf(TextEditingController cpfController) {
    String cpf = cpfController.text.replaceAll(RegExp(r'[^0-9]'), '');
    if (cpf.length != 11) return false;
    if (RegExp(r'^(\d)\1*$').hasMatch(cpf)) return false; // todos iguais

    // Validação dos dígitos verificadores
    int soma = 0;
    for (int i = 0; i < 9; i++) {
      soma += int.parse(cpf[i]) * (10 - i);
    }
    int digito1 = 11 - (soma % 11);
    if (digito1 >= 10) digito1 = 0;
    if (digito1 != int.parse(cpf[9])) return false;

    soma = 0;
    for (int i = 0; i < 10; i++) {
      soma += int.parse(cpf[i]) * (11 - i);
    }
    int digito2 = 11 - (soma % 11);
    if (digito2 >= 10) digito2 = 0;
    if (digito2 != int.parse(cpf[10])) return false;

    return true;
  }

  bool validarEmail(TextEditingController emailController) {
    String email = emailController.text.trim();
    // Regex simples para e-mail válido
    final regex = RegExp(r"^[\w\.\-]+@([\w\-]+\.)+[a-zA-Z]{2,4}$");
    return regex.hasMatch(email);
  }

  bool validarSenha(TextEditingController senhaController) {
    String senha = senhaController.text;
    // Mínimo 6 caracteres, 1 maiúscula, 1 minúscula, 1 número, 1 caractere especial
    final regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{6,}$');
    return regex.hasMatch(senha);
  }

  bool validarConfirmarSenha(
    TextEditingController confirmarSenhaController,
    TextEditingController senhaController,
  ) {
    return confirmarSenhaController.text == senhaController.text;
  }
}
