import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_frontend_flutter/app/shared/auth/repository/interfaces/auth_repository_interface.dart';
import 'package:todo_frontend_flutter/app/shared/auth/service/interfaces/auth_local_storage_service_interface.dart';

part 'auth_controller.g.dart';

@Injectable()
class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final IAuthRepository _authRepository = Modular.get();
  final IAuthLocalStorageService storage = Modular.get();

  @observable
  AuthStatus status = AuthStatus.loading;

  @observable
  Response response;

  @action
  setUser(Map user) {
    print("token $user");
    status = user['auth'] == true ? AuthStatus.logoff : AuthStatus.login;
  }

  _AuthControllerBase() {
    print("AUTHCONTROLLER");
    getToken();
  }

  @action
  Future getLogin(String email, String password) async {
    response = await _authRepository.handleLogin(email, password);
    print(response);

    storage.putToken('user', response.data);
    status = AuthStatus.login;
    return response;
  }

  Future getToken() async {
    print("GET TOKEN");
    Map user = await storage.getToken('user');
    print("VALUE $user");
    setUser(user);

    return user;
  }

  Future getRegister(String name, String email, String password) async {
    _authRepository.handleRegister(name, email, password);
    getLogin(email, password);
  }

  getLogoff() {
    storage.deleteToken('user');
    status = AuthStatus.logoff;
  }
}

enum AuthStatus { loading, login, logoff }
