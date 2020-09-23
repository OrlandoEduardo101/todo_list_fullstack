import 'package:todo_backend/models/todo_model.dart';
import 'package:todo_backend/todo_backend.dart';

class UserModel extends ManagedObject<_UserModel> implements _UserModel {}

class _UserModel {
  @primaryKey
  int id;

  @Column(unique: true)
  String name;

  @Column(unique: true)
  String email;
  
  @Column(omitByDefault: true)
  String password;

  String passwordHash;

  ManagedSet<ToDoModel> toDo;

}
