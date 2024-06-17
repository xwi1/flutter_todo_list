import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_list/store/subtask.dart';
part 'todo.g.dart';

@HiveType(typeId: 1)
class Todo = _TodoBase with _$Todo;


abstract class _TodoBase with Store {

  _TodoBase({
    required this.title,
  });

  @HiveField(0)
  String key = UniqueKey().toString();

  @HiveField(1)
  @observable
  String title;
  
  @HiveField(2)
  @observable
  int colorValue = Colors.blue.value;

  @HiveField(3)
  @observable
  List<Subtask> subtasksList = [];

  @HiveField(4)
  DateTime creationDate = DateTime.now();

  @computed
  Color get color => Color(colorValue);

  @computed
  ObservableList<Subtask> get subtasks => ObservableList.of(subtasksList);

  @action
  Future<void> addSubtask(Todo editTodo,Subtask subtask) async {
    var box = await Hive.openBox<Todo>('todos');
    // memory
    editTodo.subtasksList.add(subtask);
    box.put(key, editTodo);
    // visual
    subtasks.add(subtask);

  }

  @action
  Future<void> clearSubtasks() async {
    var box = await Hive.openBox<Todo>('todos');
    var todo = box.get(key);
    todo!.subtasksList.removeWhere((element) => element.isDone);
    box.put(key, todo);

    subtasks.removeWhere((subtask) => subtask.isDone);
  }

  
  
}