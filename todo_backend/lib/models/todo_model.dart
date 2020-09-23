import 'package:todo_backend/todo_backend.dart';

class ToDoModel extends ManagedObject<_ToDoModel> implements _ToDoModel {}


class _ToDoModel {
  @primaryKey
  int id;
  String name;
  bool done;
}


 /* @override
  Map<String, dynamic> asMap() {
    return {'id': id, 'name': name, 'done': done};
  }

  @override
  void readFromMap(Map<String, dynamic> object) {
    id = object['id'] as int;
    name = object['name'] as String;
    done = object['done'] as bool;
  }*/