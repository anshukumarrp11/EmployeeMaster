import 'package:flutter/cupertino.dart';
import 'package:todo_app_ui_ii_example/model/todo.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [];
  List<Todo> get todos => _todos.toList();
  // List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();

  // List<Todo> get todosCompleted =>
  //     _todos.where((todo) => todo.isDone == true).toList();

  void addTodo(Todo todo) {
    _todos.add(todo);

    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _todos.remove(todo);

    notifyListeners();
  }

  void updateTodo(Todo todo, String EmpCode, String EmpName, String Mobile,
      String DOB, String DOJ, String Salary, String Address, String Remark) {
    todo.EmpCode = EmpCode;
    todo.EmpName = EmpName;
    todo.Mobile = Mobile;
    todo.DOB = DOB;
    todo.DOJ = DOJ;
    todo.Salary = Salary;
    todo.Address = Address;
    todo.Remark = Remark;

    notifyListeners();
  }
}
