class LoginController {
  bool isLoginValid = false;

  bool get getIsLoginValid => isLoginValid;

  void setLoginValid(bool value) {
    isLoginValid = value;
  }

  getLoginValid() => isLoginValid;
}

class ValidarLoginController {
  String nomeCompleto;
  String cpf;
  String email;
  String senha;
  String confirmarSenha;

  ValidarLoginController(
    this.nomeCompleto,
    this.cpf,
    this.email,
    this.senha,
    this.confirmarSenha,
  );

  bool isLoginValid = false;

  bool get getIsLoginValid => isLoginValid;

  void setLoginValid(bool value) {
    isLoginValid = value;
  }

  getLoginValid() => isLoginValid;

  String validarLogin() {
    if (validarNomeCompleto()) {
      if (validarCpf()) {
        if (validarEmail()) {
          if (validarSenha()) {
            if (validarConfirmarSenha()) {
              setLoginValid(true);
              fazerLogin();
            } else {
              return 'As senhas não coincidem';
            }
          } else {
            return 'Senha inválida';
          }
        } else {
          return 'Email inválido';
        }
      } else {
        return 'CPF inválido';
      }
    } else {
      return 'Nome completo inválido';
    }
    return '';
  }

  bool validarNomeCompleto() {
    if (nomeCompleto.isEmpty || nomeCompleto.length < 5) {
      return false;
    }
    return true;
  }

  bool validarCpf() {
    if (cpf.length != 11) {
      return false;
    }
    return true;
  }

  bool validarEmail() {
    if (email.isEmpty || !email.contains('@')) {
      return false;
    }
    return true;
  }

  bool validarSenha() {
    if (senha.length < 6 ||
        !senha.contains(RegExp(r'[A-Z]')) ||
        !senha.contains(RegExp(r'[0-9]'))) {
      return false;
    }
    return true;
  }

  bool validarConfirmarSenha() {
    if (confirmarSenha != senha) {
      return false;
    }
    return true;
  }

  void fazerLogin() {
    if (getLoginValid()) {
    } else {}
  }
}
