import 'package:flutter/material.dart';

class LoginController {
  bool isLoginValid = false;

  bool get getIsLoginValid => isLoginValid;

  void setLoginValid(bool value) {
    isLoginValid = value;
  }

  getLoginValid() => isLoginValid;
}

class ValidarCadastroController {
  final TextEditingController _nomeController;
  final TextEditingController _emailController;
  final TextEditingController _cpfController;
  final TextEditingController _senhaController;
  final TextEditingController _confirmarSenhaController;

  ValidarCadastroController(
    this._nomeController,
    this._emailController,
    this._cpfController,
    this._senhaController,
    this._confirmarSenhaController,
  );

  LoginController loginController = LoginController();

  String validarCadastro() {
    if (!validarNomeCompleto()) {
      return 'Nome completo inválido';
    }
    if (!validarCpf()) {
      return 'CPF inválido';
    }
    if (!validarEmail()) {
      return 'E-mail inválido';
    }
    if (!validarSenha()) {
      return 'Senha inválida (mínimo 6 caracteres, 1 maiúscula, 1 minúscula, 1 número e 1 caractere especial)';
    }
    if (!validarConfirmarSenha()) {
      return 'As senhas não coincidem';
    }
    loginController.setLoginValid(true);
    return 'Cadastro realizado com sucesso';
  }

  bool validarNomeCompleto() {
    String nome = _nomeController.text.trim();
    // Nome deve ter pelo menos 5 letras e não conter números
    if (nome.isEmpty || nome.length < 5 || RegExp(r'[0-9]').hasMatch(nome)) {
      return false;
    }
    return true;
  }

  bool validarCpf() {
    String cpf = _cpfController.text.replaceAll(RegExp(r'[^0-9]'), '');
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

  bool validarEmail() {
    String email = _emailController.text.trim();
    // Regex simples para e-mail válido
    final regex = RegExp(r"^[\w\.\-]+@([\w\-]+\.)+[a-zA-Z]{2,4}$");
    return regex.hasMatch(email);
  }

  bool validarSenha() {
    String senha = _senhaController.text;
    // Mínimo 6 caracteres, 1 maiúscula, 1 minúscula, 1 número, 1 caractere especial
    final regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{6,}$');
    return regex.hasMatch(senha);
  }

  bool validarConfirmarSenha() {
    return _confirmarSenhaController.text == _senhaController.text;
  }
}

class ValidarLoginController {
  final TextEditingController _emailController;
  final TextEditingController _senhaController;

  ValidarLoginController(this._emailController, this._senhaController);

  LoginController loginController = LoginController();

  String validarLogin() {
    if (!validarEmail()) {
      return 'E-mail inválido';
    }
    if (!validarSenha()) {
      return 'Senha inválida';
    }
    loginController.setLoginValid(true);
    return 'Login realizado com sucesso';
  }

  bool validarEmail() {
    String email = _emailController.text.trim();
    // Regex simples para e-mail válido
    final regex = RegExp(r"^[\w\.\-]+@([\w\-]+\.)+[a-zA-Z]{2,4}$");
    return regex.hasMatch(email);
  }

  bool validarSenha() {
    String senha = _senhaController.text;
    // Mínimo 6 caracteres, 1 maiúscula, 1 minúscula, 1 número, 1 caractere especial
    final regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{6,}$');
    return regex.hasMatch(senha);
  }
}
