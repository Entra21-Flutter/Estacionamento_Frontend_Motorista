import 'package:flutter/material.dart';
import 'package:vagaja/src/controllers/validation_controller.dart';


class RecoverPasswordController {
  final TextEditingController _emailController;
  RecoverPasswordController(this._emailController);
  ValidationController validacaoController = ValidationController();

  String enviarEmail() {
    TextEditingController email = _emailController;
    if (email.text.isEmpty) {
      return 'O campo de e-mail não pode estar vazio';
    }
    if (!validacaoController.validarEmail(email)) {
      return 'E-mail inválido';
    }
    return 'E-mail de recuperação enviado com sucesso para $email';
  }
}
