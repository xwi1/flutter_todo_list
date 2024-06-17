import 'package:flutter/material.dart';
import 'package:todo_list/store/todo.dart';

class ClearSubtasksDialog extends StatelessWidget {
  const ClearSubtasksDialog({
    required this.todo,
    super.key
  });

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return 
      AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text('All done subtasks will be removed.'),
        actions: [
          ElevatedButton(
            onPressed: () {
              todo.clearSubtasks();
              Navigator.of(context).pop();
            }, 
            child: const Text('Yes')
          )
        ],
      );
  }
}