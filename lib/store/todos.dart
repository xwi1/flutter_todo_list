import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_list/store/todo.dart';
part 'todos.g.dart';

class Todos = _Todos with _$Todos;

abstract class _Todos with Store {

  _Todos() {
    getTodos();
  }

  @observable
  var list = ObservableList<Todo>();

  void getTodos() async {
    var box = await Hive.openBox<Todo>('todos');
    var todos = sortTodos(box.values.toList());
    list.addAll(todos);
  }

  List<Todo> sortTodos(List<Todo> list) {
    list.sort((a, b) => a.creationDate.compareTo(b.creationDate));
    return list;
  }

  @action
  Future<void> add(Todo todo) async {
    var box = await Hive.openBox<Todo>('todos');
    list.add(todo);
    box.put(todo.key, todo);
  }

  @action
  Future<void> remove(String key) async {
    var box = await Hive.openBox<Todo>('todos');
    list.removeWhere((element) => element.key == key);
    box.delete(key);
  }

  @action
  Future<void> edit(String key, Todo value) async {
    var box = await Hive.openBox<Todo>('todos');
    int index = list.indexWhere((element) => element.key == key);
    list[index] = value;
    box.put(key, value);
  }

}