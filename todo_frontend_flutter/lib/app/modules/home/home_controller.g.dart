// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(i<ITodoRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$nameAtom = Atom(name: '_HomeControllerBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$doneAtom = Atom(name: '_HomeControllerBase.done');

  @override
  bool get done {
    _$doneAtom.reportRead();
    return super.done;
  }

  @override
  set done(bool value) {
    _$doneAtom.reportWrite(value, super.done, () {
      super.done = value;
    });
  }

  final _$todoAtom = Atom(name: '_HomeControllerBase.todo');

  @override
  TodoModel get todo {
    _$todoAtom.reportRead();
    return super.todo;
  }

  @override
  set todo(TodoModel value) {
    _$todoAtom.reportWrite(value, super.todo, () {
      super.todo = value;
    });
  }

  final _$listAtom = Atom(name: '_HomeControllerBase.list');

  @override
  ObservableList<TodoModel> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(ObservableList<TodoModel> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_HomeControllerBase.init');

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$updateAsyncAction = AsyncAction('_HomeControllerBase.update');

  @override
  Future<dynamic> update(TodoModel value) {
    return _$updateAsyncAction.run(() => super.update(value));
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  String setName(dynamic value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool setDone(dynamic value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setDone');
    try {
      return super.setDone(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDoneTodo(dynamic value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setDoneTodo');
    try {
      return super.setDoneTodo(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool setNameTodo(dynamic value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setNameTodo');
    try {
      return super.setNameTodo(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  TodoModel setTodo(dynamic value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setTodo');
    try {
      return super.setTodo(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
done: ${done},
todo: ${todo},
list: ${list}
    ''';
  }
}
