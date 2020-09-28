import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_frontend_flutter/app/shared/models/todo_model.dart';
import 'package:todo_frontend_flutter/app/shared/utils/constants.dart';

import 'interfaces/auth_repository_interface.dart';

part 'auth_repository.g.dart';

@Injectable()
class AuthRepository implements IAuthRepository {
  final Dio client;

  AuthRepository(this.client);

  Future fetchPost() async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  Future<Response> handleLogin(String email, String password) async {
    var response = await client
        .post('/session', data: {'email': email, 'password': password});
    return response;
  }

  @override
  handleLogoff() {
    // TODO: implement handleLogoff
    throw UnimplementedError();
  }

  @override
  Future<Response> handleRegister(String name, String email, String password) async {
    await client.post('/user',
    data: {'name': name,'email': email, 'password': password},
        options: RequestOptions(
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        }
        ),
    );
  }
}
