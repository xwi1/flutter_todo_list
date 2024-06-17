import 'package:flutter/material.dart';
import 'package:todo_list/components/buttons/add_subtask_button.dart';
import 'package:todo_list/components/buttons/clear_subtasks_button.dart';
import 'package:todo_list/components/buttons/edit_todo_button.dart';
import 'package:todo_list/store/todo.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    required this.todo,
    required this.index,
    super.key
  });

  final Todo todo;
  final int index;

  @override
  Widget build(BuildContext context) {

    var options = [
      EditTodoButton(index: index),
      AddSubtaskButton(todo: todo),
      
      todo.subtasks.isEmpty?
        Container():
        ClearSubtasksButton(todo: todo)
    ];




    return IconButton(
      icon: const Icon(Icons.settings),
      onPressed: () {
        showDialog(
          context: context, 
          builder: (context) => 
            AlertDialog(
              title: const Text('Options'),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: options,
              ),
            )
        );
      },
    );
  }
}