import 'dart:convert';
import 'dart:html' hide Client;

import 'package:angular/angular.dart';
import 'package:angular_app/route_paths.dart';
import 'package:angular_app/utils/utils.dart';
import 'package:angular_router/angular_router.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:angular_forms/angular_forms.dart';

@Component(
  selector: 'login',
  templateUrl: 'login.html',
  styleUrls: [
    '../../app_component.css',
  ],
  directives: [coreDirectives, routerDirectives, formDirectives],
)
class Login {
  @ViewChild('modal')
  Element modal;

  final Router _router;

  String email;
  String password;
  Utils utils;
  //var client = Utils().client;

  Login(this._router, this.utils);

  handleLogin() async {
    var client = utils.client;
    /*FormData data = FormData.fromMap({"email": email, "password": password});
    client.options.headers['Content-type'] = "application/json";
    client.options.headers['Accept'] = "application/json";
    var response = await Dio().post("${Utils.baseUrl}/session", data: jsonEncode({"email": email, "password": password}));*/
    var response = await client.post("/session",
        data: {"email": email, "password": password},
        options: RequestOptions(
            headers: {
              //"Content-type": "application/json",
              //"Accept": "application/json",
            },
            followRedirects: false,
            validateStatus: (status) {
              return status <= 500;
            }));

    var responseBody = response.data;
    if (responseBody['auth']) {
      window.localStorage['token'] = responseBody['token'];
      utils.isLoggedIn = true;
      _router.navigate(RoutePaths.dashboard.toUrl());
    } else {
      toggleModal();
    }
  }

  toggleModal() {
    this.modal.classes.toggle('is-active');
  }
}
