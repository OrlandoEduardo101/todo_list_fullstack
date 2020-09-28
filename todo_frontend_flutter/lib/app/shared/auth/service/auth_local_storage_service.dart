import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'interfaces/auth_local_storage_service_interface.dart';

part 'auth_local_storage_service.g.dart';

@Injectable()
class AuthLocalStorageService implements IAuthLocalStorageService {
  //dispose will be called automatically
  @override
  void dispose() {}

  Completer<Box> _instance = Completer<Box>();

  _init() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    var box = await Hive.openBox('db');
    _instance.complete(box);
  }

  AuthLocalStorageService() {
    _init();
  }

  @override
  Future deleteToken(String key) async {
    var box = await _instance.future;
    box.delete(key);
  }

  @override
  Future<Map> getToken(String key) async {
    print('STORAGE GET TOKEN');
    try {
      print('box.get(key)');
      var box = await _instance.future;
      print(box.get(key));
      return box.get(key);
    } catch (e) {
      print('GET TOKE error $e');
      return null;
    }
    //rint('STORAGE GET TOKEN 2');
    // var token = box.get(key);

    //if (token.isEmpty)
    //return null;
  }

  @override
  Future putToken(String key, Map value) async {
    var box = await _instance.future;
    box.put(key, value);
  }
}
