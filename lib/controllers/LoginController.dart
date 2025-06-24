import 'package:flutter/material.dart';
import 'package:vagaja/controllers/ValidacaoController.dart';

class LoginController {
  bool isLoginValid = false;

  bool get getIsLoginValid => isLoginValid;

  void setLoginValid(bool value) {
    isLoginValid = value;
  }

  getLoginValid() => isLoginValid;
}

class ValidarLoginController {
  final TextEditingController _emailController;
  final TextEditingController _senhaController;

  ValidarLoginController(this._emailController, this._senhaController);

  LoginController loginController = LoginController();

  ValidacaoController validacaoController = ValidacaoController();

  String validarLogin() {
    if (!validacaoController.validarEmail(_emailController)) {
      return 'E-mail inválido';
    }
    if (!validacaoController.validarSenha(_senhaController)) {
      return 'Senha inválida';
    }
    loginController.setLoginValid(true);
    return 'Login realizado com sucesso';
  }
}
