import 'package:angular/core.dart';
import 'package:dio/dio.dart';

@Injectable()
class Utils {
  var isLoggedIn = false;
  static final baseUrl = "http://localhost:8888";
  static BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      // ignore: missing_return
      validateStatus: (code) {
        if (code >= 200) {
          return true;
        }
      });
  Dio client = Dio(options);
}
