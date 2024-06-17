import 'package:flutter/material.dart';
import 'package:todo_list/components/dialogs/edit_todo_dialog.dart';

class EditTodoButton extends StatelessWidget {
  const EditTodoButton({
    required this.index,
    super.key
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return 
      ElevatedButton(
        child: const Text('Edit todo'),
        onPressed: () {
          showDialog(
            context: context, 
            builder: (context) {
              return EditTodoDialog(index: index);
            },
          );
        },
      );
}
}