import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/store/todo.dart';
import 'package:todo_list/store/todos.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class AddTodoDialog extends StatelessWidget {
  const AddTodoDialog({super.key});


  @override
  Widget build(BuildContext context) {
    Todos todos = Provider.of<Todos>(context);

    Todo todo = Todo(
      title: '', 
    ); 

    void add() {
      todo.title = todo.title == ''?'New todo':todo.title;
      todos.add(todo);
      Navigator.of(context).pop();
    }

    List<Color> colors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.cyan,
      Colors.blue,
      Colors.purple
    ];


    return 
      AlertDialog(
        title: const Text('Add todo'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                onChanged: (value) {
                  todo.title = value;
                },
                decoration: const InputDecoration(
                  hintText: 'Enter todo title'
                ),
              ),
        
              BlockPicker(
                pickerColor: Colors.blue, 
                availableColors: colors,
                onColorChanged: (color) => 
                  todo.colorValue = color.value,
              )
              
            ],
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: add, 
            child: const Text('Add')
          )
        ],
      );
  }
}