import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_frontend_flutter/app/shared/models/todo_model.dart';

abstract class IAuthRepository implements Disposable {
  /*Future fetchPost();
  Future<List<TodoModel>> get(String key);
  Future put(String key, List<String> value);
  Future delete(String key);*/
  Future<Response> handleLogin(String email, String password);
  Future<Response> handleRegister(String name, String email, String password);
  handleLogoff();
}