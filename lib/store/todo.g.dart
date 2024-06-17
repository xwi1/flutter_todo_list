// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TodoAdapter extends TypeAdapter<Todo> {
  @override
  final int typeId = 1;

  @override
  Todo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Todo(
      title: fields[1] as String,
    )
      ..key = fields[0] as String
      ..colorValue = fields[2] as int
      ..subtasksList = (fields[3] as List).cast<Subtask>()
      ..creationDate = fields[4] as DateTime;
  }

  @override
  void write(BinaryWriter writer, Todo obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.key)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.colorValue)
      ..writeByte(3)
      ..write(obj.subtasksList)
      ..writeByte(4)
      ..write(obj.creationDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Todo on _TodoBase, Store {
  Computed<Color>? _$colorComputed;

  @override
  Color get color => (_$colorComputed ??=
          Computed<Color>(() => super.color, name: '_TodoBase.color'))
      .value;
  Computed<ObservableList<Subtask>>? _$subtasksComputed;

  @override
  ObservableList<Subtask> get subtasks => (_$subtasksComputed ??=
          Computed<ObservableList<Subtask>>(() => super.subtasks,
              name: '_TodoBase.subtasks'))
      .value;

  late final _$titleAtom = Atom(name: '_TodoBase.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$colorValueAtom =
      Atom(name: '_TodoBase.colorValue', context: context);

  @override
  int get colorValue {
    _$colorValueAtom.reportRead();
    return super.colorValue;
  }

  @override
  set colorValue(int value) {
    _$colorValueAtom.reportWrite(value, super.colorValue, () {
      super.colorValue = value;
    });
  }

  late final _$subtasksListAtom =
      Atom(name: '_TodoBase.subtasksList', context: context);

  @override
  List<Subtask> get subtasksList {
    _$subtasksListAtom.reportRead();
    return super.subtasksList;
  }

  @override
  set subtasksList(List<Subtask> value) {
    _$subtasksListAtom.reportWrite(value, super.subtasksList, () {
      super.subtasksList = value;
    });
  }

  late final _$addSubtaskAsyncAction =
      AsyncAction('_TodoBase.addSubtask', context: context);

  @override
  Future<void> addSubtask(Todo editTodo, Subtask subtask) {
    return _$addSubtaskAsyncAction
        .run(() => super.addSubtask(editTodo, subtask));
  }

  late final _$clearSubtasksAsyncAction =
      AsyncAction('_TodoBase.clearSubtasks', context: context);

  @override
  Future<void> clearSubtasks() {
    return _$clearSubtasksAsyncAction.run(() => super.clearSubtasks());
  }

  @override
  String toString() {
    return '''
title: ${title},
colorValue: ${colorValue},
subtasksList: ${subtasksList},
color: ${color},
subtasks: ${subtasks}
    ''';
  }
}
