import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/store/todo.dart';
import 'package:todo_list/store/todos.dart';

class EditTodoDialog extends StatelessWidget {
  const EditTodoDialog({
    required this.index,
    super.key
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    Todos todos = Provider.of<Todos>(context);

    Todo todo = todos.list[index];

    Todo newTodo = Todo(
      title: todo.title,
    );
    newTodo.key = todo.key;
    newTodo.subtasksList = todo.subtasks;
    newTodo.creationDate = todo.creationDate;


    List<Color> colors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.cyan,
      Colors.blue,
      Colors.purple
    ];

    void edit() {
      todos.edit(todo.key, newTodo);
      Navigator.of(context).pop();
    }



    return 
      AlertDialog(
        title: const Text('Edit todo'),
        content: SingleChildScrollView(
          child: Column(
            
            mainAxisSize: MainAxisSize.min,
            children: [
        
              TextFormField(
                initialValue: todo.title,
                onChanged: (value) => newTodo.title = value,
              ),

              const Padding(padding: EdgeInsets.only(bottom: 20)),
        
              BlockPicker(
                useInShowDialog: true,
                availableColors: colors,
                pickerColor: todo.color, 
                onColorChanged: (color) => newTodo.colorValue = color.value
              )
            ]
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: edit,
            child: const Text('Edit'),
          )
        ],
      );
  }
}