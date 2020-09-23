import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:todo_backend/models/user_model.dart';
import 'package:todo_backend/todo_backend.dart';
import 'package:todo_backend/utils/utils.dart';

class JwtMiddleware extends Controller {
  final ManagedContext context;

  JwtMiddleware(this.context);

  @override
  FutureOr<RequestOrResponse> handle(Request request) async {
    final authHeader = request.raw.headers["authorization"];
    if (authHeader.isEmpty) return Response.unauthorized();

    final authHeaderContent = authHeader[0].split(" ");
    if (authHeaderContent.length != 2 || authHeaderContent[0] != "Bearer")
      return Response.badRequest();

    String jwtToken = authHeaderContent[1];

    try {
      final JwtClaim decClaimSet =
          verifyJwtHS256Signature(jwtToken, Utils.jwtKey);
      final userId = int.parse(decClaimSet.toJson()["sub"].toString());
      if (userId == null) throw JwtException;
      //verify if JWT atualized
      final currentData = DateTime.now().toUtc();
      if (currentData.isAfter(decClaimSet.expiry))
        return Response.unauthorized();

      //validate if user exists
      final query = Query<UserModel>(context)
        ..where((user) => user.id).equalTo(userId);
      final user = await query.fetchOne();

      if (user == null) return Response.unauthorized();
      request.attachments['user'] = user;
    } on JwtException {
      return Response.unauthorized();
    }

    return request;
  }
}
