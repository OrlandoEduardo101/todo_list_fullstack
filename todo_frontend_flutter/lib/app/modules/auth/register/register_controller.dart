import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_frontend_flutter/app/shared/auth/auth_controller.dart';

part 'register_controller.g.dart';

@Injectable()
class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  AuthController auth = Modular.get();

  @observable
  String name;

  @observable
  String email;

  @observable
  String password;

  @action
  String setName(value) => name = value;

  @action
  String setEmail(value) => email = value;

  @action
  String setPassword(value) => password = value;

  void register() {
    auth.getRegister(name, email, password);
    Modular.to.pushNamed('/auth');
  }
}
