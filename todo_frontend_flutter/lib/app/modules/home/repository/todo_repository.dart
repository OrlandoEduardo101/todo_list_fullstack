import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_frontend_flutter/app/modules/home/models/todo_model.dart';
import 'package:todo_frontend_flutter/app/shared/auth/auth_controller.dart';

import 'interfaces/todo_repository_interface.dart';

part 'todo_repository.g.dart';

@Injectable()
class TodoRepository implements ITodoRepository {
  final Dio client;
  AuthController auth = Modular.get();

  TodoRepository(this.client);

  Future fetchPost() async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  Future delete(TodoModel value) async {
    await client.delete("/todo/${value.id}",
        options: RequestOptions(headers: {'Authorization': auth.token}));
    //getall();
  }

  @override
  Future<List<TodoModel>> getall() async {
    print(auth.token);
    var response = await client.get("/todo",
        options: RequestOptions(headers: {
          //'Content-type': 'application/json',
          //'Accept': 'application/json',
          'Authorization': auth.token
        }));
    List<TodoModel> todoList = [];

    for (var item in response.data) {
      print("ITEM $item");
      TodoModel model = TodoModel.fromJson(item);
      //TodoModel(done: item['done'], id: item['id'], name: item['name'], user: item['user']);
      print(model.name);
      todoList.add(model);
    }
    return todoList;
  }

  @override
  Future<List<TodoModel>> getbyid(String key) {
    // TODO: implement getbyid
    throw UnimplementedError();
  }

  @override
  Future put(TodoModel value) async {
    await client.put("/todo/${value.id}",
        data: value.toJson(),
        options: RequestOptions(headers: {'Authorization': auth.token}));
  }

  @override
  Future insert(TodoModel value) async {
    await client.post("/todo",
        data: {"name": value.name, "done": value.done},
        options: RequestOptions(headers: {
          'Authorization': auth.token
        }));
  }
}
