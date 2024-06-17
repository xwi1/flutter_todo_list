// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Todos on _Todos, Store {
  late final _$listAtom = Atom(name: '_Todos.list', context: context);

  @override
  ObservableList<Todo> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(ObservableList<Todo> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  late final _$addAsyncAction = AsyncAction('_Todos.add', context: context);

  @override
  Future<void> add(Todo todo) {
    return _$addAsyncAction.run(() => super.add(todo));
  }

  late final _$removeAsyncAction =
      AsyncAction('_Todos.remove', context: context);

  @override
  Future<void> remove(String key) {
    return _$removeAsyncAction.run(() => super.remove(key));
  }

  late final _$editAsyncAction = AsyncAction('_Todos.edit', context: context);

  @override
  Future<void> edit(String key, Todo value) {
    return _$editAsyncAction.run(() => super.edit(key, value));
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
