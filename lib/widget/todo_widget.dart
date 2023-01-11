import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_ui_ii_example/model/todo.dart';
import 'package:todo_app_ui_ii_example/page/edit_todo_page.dart';
import 'package:todo_app_ui_ii_example/provider/todos.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;

  const TodoWidget({
    @required this.todo,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Slidable(
          actionPane: SlidableDrawerActionPane(),
          key: Key(todo.id),
          actions: [
            IconSlideAction(
              color: Colors.green,
              onTap: () => editTodo(context, todo),
              caption: 'Edit',
              icon: Icons.edit,
            )
          ],
          secondaryActions: [
            IconSlideAction(
              color: Colors.red,
              caption: 'Delete',
              onTap: () => deleteTodo(context, todo),
              icon: Icons.delete,
            )
          ],
          child: buildTodo(context),
        ),
      );

  Widget buildTodo(BuildContext context) => GestureDetector(
        onTap: () => editTodo(context, todo),
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(15),
          // child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'ID: ' + todo.EmpCode,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              Text(
                'Name: ' + todo.EmpName,
                style: TextStyle(fontSize: 20, height: 1.5),
              ),
              Text(
                'Mobile no: ' + todo.Mobile,
                style: TextStyle(fontSize: 20, height: 1.5),
              ),
              Text(
                'DOB:' + todo.DOB,
                style: TextStyle(fontSize: 20, height: 1.5),
              ),
              Text(
                'DOJ:' + todo.DOJ,
                style: TextStyle(fontSize: 20, height: 1.5),
              ),
              Text(
                'Salary: ' + todo.Salary,
                style: TextStyle(fontSize: 20, height: 1.5),
              ),
              Text(
                'Address: ' + todo.Address,
                style: TextStyle(fontSize: 20, height: 1.5),
              ),
              Text(
                'Remark: ' + todo.Remark,
                style: TextStyle(fontSize: 20, height: 1.5),
              ),
            ],
          ),
        ),
      );

  void deleteTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(todo);
  }

  void editTodo(BuildContext context, Todo todo) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => EditTodoPage(todo: todo),
        ),
      );
}
