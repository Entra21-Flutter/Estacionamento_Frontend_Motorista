import 'package:flutter/material.dart';

import 'package:vagaja/src/services/auth_service.dart';
import 'package:vagaja/src/services/validation_service.dart';


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

  // LoginController loginController = LoginController();

  ValidationService validacaoService = ValidationService();
  String validarCadastro() {
    if (!validacaoService.validarNomeCompleto(_nomeController)) {
      return 'Nome completo inválido';
    }
    if (!validacaoService.validarCpf(_cpfController)) {
      return 'CPF inválido';
    }
    if (!validacaoService.validarEmail(_emailController)) {
      return 'E-mail inválido';
    }
    if (!validacaoService.validarSenha(_senhaController)) {
      return 'Senha inválida (mínimo 6 caracteres, 1 maiúscula, 1 minúscula, 1 número e 1 caractere especial)';
    }
    if (!validacaoService.validarConfirmarSenha(
      _confirmarSenhaController,
      _senhaController,
    )) {
      return 'As senhas não coincidem';
    }
    AuthService.login();
    return 'Cadastro realizado com sucesso';
  }
}
