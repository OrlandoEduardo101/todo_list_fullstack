import 'dart:html';

import 'package:todo_backend/models/user_model.dart';
import 'package:todo_backend/todo_backend.dart';
import 'package:todo_backend/utils/utils.dart';

class UserController extends ResourceController {
  final ManagedContext context;
  UserController(this.context) {
    acceptedContentTypes = [ContentType.json];
  }

  @Operation.post()
  Future<Response> postUser() async {
    final body = UserModel()..read(await request.body.decode(), ignore: ["id"]);
    final query = Query<UserModel>(context);
    body.passwordHash = Utils.generateSHA256Hash(body.password);
    query.values.email = body.email;
    query.values.passwordHash = body.passwordHash;
    query.values.name = body.name;
    final user = await query.insert();
    return Response.ok("Succesful created user");
  }
}
