import 'package:flutter/material.dart';
import 'package:todo_list/components/dialogs/add_subtask_dialog.dart';
import 'package:todo_list/store/todo.dart';

class AddSubtaskIconButton extends StatelessWidget {
  const AddSubtaskIconButton({
    required this.todo,
    super.key
  });

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return 
      IconButton(
        icon: const Icon(Icons.bookmark_add_outlined),
        onPressed: () {
          showDialog(
            context: context, 
            builder: (context) => 
              AddSubtaskDialog(todo: todo),
          );
        }, 
      );
  }
}