import 'package:dio/native_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_frontend_flutter/app/shared/models/todo_model.dart';

import 'interfaces/auth_repository_interface.dart';

part 'auth_repository.g.dart';

@Injectable()
class AuthRepository implements IAuthRepository {
  final DioForNative client;

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
  Future delete(String key) {
      // TODO: implement delete
      throw UnimplementedError();
    }
  
    @override
    Future<List<TodoModel>> get(String key) {
      // TODO: implement get
      throw UnimplementedError();
    }
  
    @override
    Future put(String key, List<String> value) {
    // TODO: implement put
    throw UnimplementedError();
  }
}
