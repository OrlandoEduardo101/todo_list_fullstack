import 'package:flutter_modular/flutter_modular.dart';

abstract class IAuthLocalStorageService implements Disposable {
  Future<Map> getToken(String key);
  Future putToken(String key, Map value);
  Future deleteToken(String key);
}
