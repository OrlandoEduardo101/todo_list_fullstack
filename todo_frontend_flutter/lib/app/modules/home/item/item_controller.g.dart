// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ItemController = BindInject(
  (i) => ItemController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ItemController on _ItemControllerBase, Store {
  final _$valueAtom = Atom(name: '_ItemControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_ItemControllerBaseActionController =
      ActionController(name: '_ItemControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_ItemControllerBaseActionController.startAction(
        name: '_ItemControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_ItemControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
