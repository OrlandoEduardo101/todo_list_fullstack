import 'package:todo_frontend_flutter/app/modules/auth/login/login_page.dart';
import 'package:todo_frontend_flutter/app/modules/auth/register/register_page.dart';

import 'register/register_controller.dart';
import 'login/login_controller.dart';
import 'auth_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'auth_page.dart';

class AuthModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $RegisterController,
        $LoginController,
        $AuthController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => LoginPage()),
        ModularRouter('/register', child: (_, args) => RegisterPage()),
      ];

  static Inject get to => Inject<AuthModule>.of();
}
