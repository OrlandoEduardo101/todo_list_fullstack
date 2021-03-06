import 'package:todo_backend/models/todo_model.dart';
import 'package:todo_backend/models/user_model.dart';
import 'package:todo_backend/todo_backend.dart';

class ToDoController extends ResourceController {
  ToDoController(this.context) {
    acceptedContentTypes = [ContentType.json];
  }

  final ManagedContext context;

  @Operation.get()
  Future<Response> getAllToDos() async {
    UserModel user = request.attachments['user'] as UserModel;
    final query = await Query<ToDoModel>(context)..where((todo) => todo.user.id).equalTo(user.id);
    final toDos = await query.fetch();
    return Response.ok(toDos);
  }

  @Operation.get('id')
  Future<Response> getToDoById() async {
    UserModel user = request.attachments['user'] as UserModel;
    final id = int.parse(request.path.variables['id']);
    final query = Query<ToDoModel>(context)
      ..where((todo) => todo.id).equalTo(id)
      ..where((todo) => todo.user.id).equalTo(user.id);
    final todo = await query.fetchOne();

    if (todo == null){ return Response.notFound();}

    return Response.ok(todo);
  }

  @Operation.post()
  Future<Response> postTodo() async {
    UserModel user = request.attachments['user'] as UserModel;
    final body = ToDoModel()..read(await request.body.decode(), ignore: ["id"]);
    final query = Query<ToDoModel>(context)
      ..values.name = body.name
      ..values.done = body.done
      ..values.user.id = user.id;
    final todo = await query.insert();
    return Response.ok(todo);
  }

  @Operation.put('id')
  Future<Response> putTodo(@Bind.path("id") int id) async {
    UserModel user = request.attachments['user'] as UserModel;
    final body = ToDoModel()..read(await request.body.decode(), ignore: ["id"]);
    final query = Query<ToDoModel>(context)
      ..values = body
      ..where((todo) => todo.id).equalTo(id)
      ..where((todo) => todo.user.id).equalTo(user.id);
    final todo = await query.updateOne();
    return Response.ok(todo);
  }

  @Operation.delete('id')
  Future<Response> deleteTodoById(@Bind.path("id") int id) async {
    UserModel user = request.attachments['user'] as UserModel;
    final query = Query<ToDoModel>(context)
      ..where((todo) => todo.id).equalTo(id)
      ..where((todo) => todo.user.id).equalTo(user.id);
    await query.delete();
    return Response.ok({'ok': true});
  }
}
