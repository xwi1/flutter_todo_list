import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_list/store/todo.dart';
import '../dialogs/add_todo_dialog.dart';

class AddTodoButton extends StatelessWidget {
  const AddTodoButton({super.key});

  @override
  Widget build(BuildContext context) {

    return FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          showDialog(
            context: context, 
            builder: (context) {
              return const AddTodoDialog();
            },
          );
          
        }
      );
  }
}

