import 'package:flutter/material.dart';
import 'package:todo_list/components/dialogs/add_subtask_dialog.dart';
import 'package:todo_list/store/todo.dart';

class AddSubtaskButton extends StatelessWidget {
  const AddSubtaskButton({
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
            AddSubtaskDialog(todo: todo)
        );
      },
      child: const Text('Add new subtask')
    );
  }
}