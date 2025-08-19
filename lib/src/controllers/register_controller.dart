import 'package:flutter/material.dart';
import 'package:vagaja/src/controllers/login_controller.dart';
import 'package:vagaja/src/controllers/validation_controller.dart';


class RegisterController {
  final TextEditingController _nomeController;
  final TextEditingController _emailController;
  final TextEditingController _cpfController;
  final TextEditingController _senhaController;
  final TextEditingController _confirmarSenhaController;

  RegisterController(
    this._nomeController,
    this._emailController,
    this._cpfController,
    this._senhaController,
    this._confirmarSenhaController,
  );

  LoginController loginController = LoginController();

  ValidationController validacaoController = ValidationController();
  String validarCadastro() {
    if (!validacaoController.validarNomeCompleto(_nomeController)) {
      return 'Nome completo inválido';
    }
    if (!validacaoController.validarCpf(_cpfController)) {
      return 'CPF inválido';
    }
    if (!validacaoController.validarEmail(_emailController)) {
      return 'E-mail inválido';
    }
    if (!validacaoController.validarSenha(_senhaController)) {
      return 'Senha inválida (mínimo 6 caracteres, 1 maiúscula, 1 minúscula, 1 número e 1 caractere especial)';
    }
    if (!validacaoController.validarConfirmarSenha(
      _confirmarSenhaController,
      _senhaController,
    )) {
      return 'As senhas não coincidem';
    }
    loginController.setLoginValid(true);
    return 'Cadastro realizado com sucesso';
  }
}
