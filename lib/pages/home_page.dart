import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/components/buttons/add_todo_button.dart';
import 'package:todo_list/components/todo_item.dart';
import 'package:todo_list/store/todos.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    final todos = Provider.of<Todos>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo list'),
      ),
      body: 
        Observer(
          builder: (context) =>  
            ListView.builder(
              itemCount: todos.list.length,
              itemBuilder: (context, index) => 
                TodoListItem(todo: todos.list[index]),
            ),
        ),
      
      floatingActionButton: const AddTodoButton(),
    );
  }
}