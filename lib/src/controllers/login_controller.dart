import 'package:flutter/material.dart';
import 'package:vagaja/src/controllers/validation_controller.dart';

class LoginController {
  bool isLoginValid = true;

  bool get getIsLoginValid => isLoginValid;

  void setLoginValid(bool value) {
    isLoginValid = value;
  }

  getLoginValid() => isLoginValid;
}

class ValidationLoginController {
  final TextEditingController _emailController;
  final TextEditingController _senhaController;

  ValidationLoginController(this._emailController, this._senhaController);

  LoginController loginController = LoginController();

  ValidationController validacaoController = ValidationController();

  String validarLogin() {
    if (!validacaoController.validarEmail(_emailController)) {
      return 'E-mail inválido';
    }
    if (!validacaoController.validarSenha(_senhaController)) {
      return 'Senha inválida (mínimo 6 caracteres, 1 maiúscula, 1 minúscula, 1 número e 1 caractere especial)';
    }
    
    loginController.setLoginValid(true);
    return 'Login realizado com sucesso';
  }
}
