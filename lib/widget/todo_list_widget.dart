import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:todo_app_ui_ii_example/provider/todos.dart';

import 'package:todo_app_ui_ii_example/widget/todo_widget.dart';

class TodoListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todos;
    int count = 0;

    return ListView.separated(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(16),
        separatorBuilder: (context, index) => Container(height: 8),
        itemCount: todos.length,
        // ignore: missing_return
        itemBuilder: (context, index) {
          final todo = todos[index];
          return TodoWidget(todo: todo);
        });
  }
}
