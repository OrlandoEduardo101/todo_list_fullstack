import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_frontend_flutter/app/modules/home/models/todo_model.dart';
import 'package:todo_frontend_flutter/app/modules/home/repository/interfaces/todo_repository_interface.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final ITodoRepository repository;

  @observable
  String name = '';

  @observable
  bool done = false;

  @observable
  TodoModel todo = TodoModel();

  _HomeControllerBase(this.repository) {
    init();
  }

  @action
  String setName(value) => name = value;

  @action
  bool setDone(value) => done = value;

  @action
  setDoneTodo(value) {
    todo.done = value;
    print(value);
    return todo;
  }

  @action
  bool setNameTodo(value) => todo.name = value;

  @action
  TodoModel setTodo(value) => todo = value;

  @observable
  ObservableList<TodoModel> list = <TodoModel>[].asObservable();

  @action
  init() async {
    List<TodoModel> listLocal = await repository.getall();
    if (listLocal == null) {
      list = <TodoModel>[].asObservable();
    } else {
      list = listLocal.asObservable();
    }
  }

  @action
  Future update(TodoModel value) async {
    await repository.put(value);
    init();
  }

  Future insert() async {
    todo.name = name;
    todo.done = done;
    await repository.insert(todo);
    init();
  }

  Future delete(TodoModel value) async {
    await repository.delete(value);
    init();
  }

  /*@action
  void save() {
    list.add(text);
    debugPrint(list[0].toString());
    storage.put('list', list);
  }

  @action
  void remove(int index) {
    list.removeAt(index);
    debugPrint(list[0].toString());
    storage.put('list', list);
  }*/
}
