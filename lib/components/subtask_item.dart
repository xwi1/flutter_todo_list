import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_list/store/subtask.dart';

class SubtaskItem extends StatelessWidget {
  const SubtaskItem({
    required this.subtask,
    super.key
  });

  final Subtask subtask;

  @override
  Widget build(BuildContext context) {
    return 
      Observer(builder: (context) => 
        ListTile(
          title: Text(
            subtask.title,
            style: TextStyle(
              decoration: subtask.isDone?
                TextDecoration.lineThrough
                :TextDecoration.none
            ),
          ),
          trailing: Checkbox(
            onChanged: (value) {
              subtask.isDone = value!;
            },
            value: subtask.isDone,
          ),
        )
      );
  }
}