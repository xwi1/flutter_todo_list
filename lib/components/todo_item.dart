import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/components/buttons/add_subtask_icon_button.dart';
import 'package:todo_list/components/dialogs/on_dismiss_dialog.dart';
import 'package:todo_list/components/buttons/settings_button.dart';
import 'package:todo_list/components/subtask_item.dart';
import 'package:todo_list/store/todos.dart';

import '../store/todo.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({
    required this.todo,
    super.key
  });
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    Todos todos = Provider.of<Todos>(context);

    

    return 
      Dismissible(
        onDismissed: (direction) {
          todos.remove(todo.key);
        },

        confirmDismiss: (direction) =>
          showDialog(
            context: context, 
            builder: (context) => const OnDismissDialog()
          ),
        
        key: UniqueKey(), 
        child: Observer(builder: (_) =>
          Card(
            child:
              ExpansionTile(
                
                collapsedBackgroundColor: todo.color,
                collapsedTextColor: Colors.black,
                collapsedIconColor: Colors.black,
                

                backgroundColor: todo.color,
                textColor: Colors.black,
                iconColor: Colors.black,

                title: Text(todo.title),
                
                leading: todo.subtasks.isEmpty?
                  const Icon(Icons.task_alt):
                  const Icon(Icons.list),

                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    
                    todo.subtasks.isEmpty?
                      Container():
                      AddSubtaskIconButton(todo: todo),
                    
                    SettingsButton(todo: todo, index: todos.list.indexOf(todo))
                  ]
                ),
                
                children: todo.subtasks.map((subtask) => 
                  SubtaskItem(subtask: subtask)
                ).toList(),
              )
          )
        )
      );
  }
}
