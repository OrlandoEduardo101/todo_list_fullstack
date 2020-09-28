import 'package:hive/hive.dart';
import 'package:todo_frontend_flutter/app/modules/auth/auth_module.dart';
import 'package:todo_frontend_flutter/app/shared/auth/repository/auth_repository.dart';
import 'package:todo_frontend_flutter/app/shared/utils/constants.dart';
import 'package:todo_frontend_flutter/app/splash/splash_page.dart';

import 'shared/auth/service/auth_local_storage_service.dart';
import 'shared/auth/auth_controller.dart';
import 'package:dio/dio.dart';
import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:todo_frontend_flutter/app/app_widget.dart';
import 'package:todo_frontend_flutter/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $AuthLocalStorageService,
        $AuthController,
        $AuthRepository,
        $AuthRepository,
        $AppController,
        Bind((i) => Dio(BaseOptions(baseUrl: url_base))),
        Bind((i) => Hive)
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => SplashPage()),
        ModularRouter('/auth', module: AuthModule()),
        ModularRouter('/home', module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
