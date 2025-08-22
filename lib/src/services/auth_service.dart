class AuthService {
  //não está sendo usado
  static bool isLoggedIn = false; // false para ter que logar

  static void login(){
    isLoggedIn = true;
  }
  static void logout(){
    isLoggedIn = false;
    
  }
}