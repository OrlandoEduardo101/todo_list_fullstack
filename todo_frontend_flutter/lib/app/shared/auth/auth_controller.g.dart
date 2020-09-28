// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $AuthController = BindInject(
  (i) => AuthController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthController on _AuthControllerBase, Store {
  final _$statusAtom = Atom(name: '_AuthControllerBase.status');

  @override
  AuthStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(AuthStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$responseAtom = Atom(name: '_AuthControllerBase.response');

  @override
  Response<dynamic> get response {
    _$responseAtom.reportRead();
    return super.response;
  }

  @override
  set response(Response<dynamic> value) {
    _$responseAtom.reportWrite(value, super.response, () {
      super.response = value;
    });
  }

  final _$tokenAtom = Atom(name: '_AuthControllerBase.token');

  @override
  String get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(String value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  final _$getLoginAsyncAction = AsyncAction('_AuthControllerBase.getLogin');

  @override
  Future<dynamic> getLogin(String email, String password) {
    return _$getLoginAsyncAction.run(() => super.getLogin(email, password));
  }

  final _$_AuthControllerBaseActionController =
      ActionController(name: '_AuthControllerBase');

  @override
  dynamic setUser(Map<dynamic, dynamic> user) {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction(
        name: '_AuthControllerBase.setUser');
    try {
      return super.setUser(user);
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status},
response: ${response},
token: ${token}
    ''';
  }
}
