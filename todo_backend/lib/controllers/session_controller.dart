import 'package:todo_backend/models/user_model.dart';
import 'package:todo_backend/todo_backend.dart';
import 'package:todo_backend/utils/utils.dart';

class SessionController extends ResourceController {
  final ManagedContext context;

  SessionController(this.context) {
    acceptedContentTypes = [ContentType.json];
  }

  @Operation.post()
  Future<Response> login() async {
    final body = UserModel()..read(await request.body.decode());
    final passwordHash = Utils.generateSHA256Hash(body.password);
    final query = Query<UserModel>(context)
      ..where((user) => user.email).like(body.email)
      ..where((user) => user.passwordHash).like(passwordHash.toString());
    final user = await query.fetchOne();

    if (user == null) return Response.ok({"auth": false, "token": ""});
    final jwt = Utils.generateJWT(user);
    return Response.ok({"auth": true, "token": jwt});
  }
}
