import 'package:flutter/material.dart';
import 'package:todo_list/store/subtask.dart';
import 'package:todo_list/store/todo.dart';

class AddSubtaskDialog extends StatelessWidget {
  const AddSubtaskDialog({
    required this.todo,
    super.key
  });

  final Todo todo;

  @override
  Widget build(BuildContext context) {

    Subtask subtask = Subtask(title: 'New subtask');

    return 
      AlertDialog(
        title: const Text('Add subtask'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter subtask title'
              ),
              onChanged: (value) {
                subtask.title = value;
              },
            )
          ]
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              todo.addSubtask(todo, subtask);
              Navigator.of(context).pop();
            }, 
            child: const Text('Add')
          )
        ],
      );
  }
}