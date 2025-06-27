import 'package:vagaja/src/models/user_model.dart';

class LoginController {
  UserModel _User = UserModel(username: "admin", password: "12345");

  Future <bool> login(String username, String password) async{
    await Future.delayed(Duration(seconds: 2));
    return username == _User.username && password == _User.password;
  }
}