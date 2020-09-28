import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_frontend_flutter/app/shared/auth/auth_controller.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  AuthController auth = Modular.get();
  @observable
  String email;

  @observable
  String password;

  _LoginControllerBase();

  @action
  String setEmail(value) => email = value;

  @action
  String setPassword(value) => password = value;

  Future<void> login() async {
    Response user = await auth.getLogin(email, password);
    if (user.data['auth']) {
      Modular.to.pushNamed('home');
    } else {
      print('Error ${user.statusCode} ${user.statusMessage}');
    }
  }
}
