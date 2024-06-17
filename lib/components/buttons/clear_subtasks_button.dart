import 'package:flutter/material.dart';
import 'package:todo_list/components/dialogs/clear_subtasks_dialog.dart';
import 'package:todo_list/store/todo.dart';

class ClearSubtasksButton extends StatelessWidget {
  const ClearSubtasksButton({
    required this.todo,
    super.key
  });

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context, 
          builder: (context) => 
            ClearSubtasksDialog(todo: todo)
        );
      }, 
      child: const Text('Clear all done')
    );
  }
}