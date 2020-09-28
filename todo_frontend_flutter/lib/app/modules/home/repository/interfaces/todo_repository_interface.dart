import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_frontend_flutter/app/modules/home/models/todo_model.dart';

abstract class ITodoRepository implements Disposable {
  Future fetchPost();
  Future<List<TodoModel>> getbyid(String key);
  Future<List<TodoModel>> getall();
  Future put(TodoModel value);
  Future insert(TodoModel value);
  Future delete(TodoModel value);
}
