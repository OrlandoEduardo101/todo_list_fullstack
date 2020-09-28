import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../auth_controller.dart';

class AuthStatusService extends Disposable {
  //dispose will be called automatically
  @override
  void dispose() {}

  ReactionDisposer disposer;

  @action
  AuthStatusService() {
    disposer = autorun((_) {
      final auth = Modular.get<AuthController>();
      print(auth.status.toString());
      if (auth.status != AuthStatus.login) {
        print("login");
        Modular.to.pushReplacementNamed('/auth');
      }
    });
  }
}
