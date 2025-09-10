import 'package:flutter/material.dart';

import 'package:vagaja/src/services/auth_service.dart';
import 'package:vagaja/src/services/validation_service.dart';

class ValidationLoginController {
  final TextEditingController _emailController;
  final TextEditingController _senhaController;
  String mensagem = "";

  ValidationLoginController(this._emailController, this._senhaController);

  ValidationService validacaoService = ValidationService();

  bool validarLogin() {
    
    if (!validacaoService.validarEmail(_emailController)) {
      mensagem = 'E-mail inválido';
      return  false;
    }
    if (!validacaoService.validarSenha(_senhaController)) {
      mensagem ='Informe uma senha';
      return false;
    }
    
    AuthService.login();
    mensagem = 'Login realizado com sucesso';
    return true;
  }

  void mostrarMensagem(BuildContext context){
  ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(mensagem)));
  }
}

