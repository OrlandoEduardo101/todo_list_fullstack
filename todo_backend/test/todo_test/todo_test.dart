import 'package:aqueduct_test/aqueduct_test.dart';
import 'package:test/test.dart';
import 'package:todo_backend/controllers/todo_controller.dart';
import 'package:todo_backend/models/todo_model.dart';
import 'package:todo_backend/todo_backend.dart';
import 'package:array_frequency_calculator/array_frequency_calculator.dart'
    as frequency;

Future main() async {
  ManagedContext context;
  Request request;
  test('todo get all', () async {
    print(frequency.WordsCalculator('Fala zeze zeze fala fala'));
    final toDoController = ToDoController(context);
    //expect((await toDoController.getAllToDos()).statusCode, equals(200));
  });

  test('todo post', () async {
    final toDoController = ToDoController(context);

    expect((await toDoController.postTodo()).statusCode, equals(200));
  });

  test('todo put', () async {
    final toDoController = ToDoController(context);
    final body = ToDoModel()..read(await request.body.decode(), ignore: ["id"]);
    final query = Query<ToDoModel>(context)
      ..values.name = body.name
      ..values.done = body.done;
    final todo = await query.insert();
    expect((await toDoController.putTodo(todo.id)).statusCode, equals(200));
    //expectResponse( await toDoController.putTodo(todo), 200);
  });
}
