import 'package:flutter/material.dart';
import 'package:vagaja/src/controllers/validacao_controller.dart';


class RecuperarSenhaController {
  final TextEditingController _emailController;
  RecuperarSenhaController(this._emailController);
  ValidacaoController validacaoController = ValidacaoController();

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
