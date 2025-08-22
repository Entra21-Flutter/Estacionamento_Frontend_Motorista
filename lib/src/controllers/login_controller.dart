import 'package:flutter/material.dart';
import 'package:vagaja/src/controllers/validation_controller.dart';
import 'package:vagaja/src/services/auth_service.dart';

class ValidationLoginController {
  final TextEditingController _emailController;
  final TextEditingController _senhaController;
  String mensagem = "";

  ValidationLoginController(this._emailController, this._senhaController);

  ValidationController validacaoController = ValidationController();

  bool validarLogin() {
    
    if (!validacaoController.validarEmail(_emailController)) {
      mensagem = 'E-mail inválido';
      return  false;
    }
    if (!validacaoController.validarSenha(_senhaController)) {
      mensagem ='Senha inválida (mínimo 6 caracteres, 1 maiúscula, 1 minúscula, 1 número e 1 caractere especial)';
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

