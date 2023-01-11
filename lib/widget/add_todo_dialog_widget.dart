import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_ui_ii_example/model/todo.dart';
import 'package:todo_app_ui_ii_example/provider/todos.dart';
import 'package:todo_app_ui_ii_example/widget/todo_form_widget.dart';

class AddTodoDialogWidget extends StatefulWidget {
  @override
  _AddTodoDialogWidgetState createState() => _AddTodoDialogWidgetState();
}

class _AddTodoDialogWidgetState extends State<AddTodoDialogWidget> {
  final _formKey = GlobalKey<FormState>();

  String EmpCode = '';
  String EmpName = '';
  String Mobile = '';
  String DOB = '';
  String DOJ = '';
  String Salary = '';
  String Address = '';
  String Remark = '';

  @override
  Widget build(BuildContext context) => AlertDialog(
        content: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add Employee',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 8),
                TodoFormWidget(
                  onChangedEmpCode: (UserModel) =>
                      setState(() => this.EmpCode = EmpCode),
                  onChangedEmpName: (EmpName) =>
                      setState(() => this.EmpName = EmpName),
                  onChangedMobile: (Mobile) =>
                      setState(() => this.Mobile = Mobile),
                  onChangedDOB: (DOB) => setState(() => this.DOB = DOB),
                  onChangedDOJ: (DOJ) => setState(() => this.DOJ = DOJ),
                  onChangedSalary: (Salary) =>
                      setState(() => this.Salary = Salary),
                  onChangedAddress: (Address) =>
                      setState(() => this.Address = Address),
                  onChangedRemark: (Remark) =>
                      setState(() => this.Remark = Remark),
                  onSavedTodo: addTodo,
                ),
              ],
            ),
          ),
        ),
      );

  void addTodo() {
    final isValid = _formKey.currentState.validate();

    if (!isValid) {
      return;
    } else {
      final todo = Todo(
        id: EmpCode,
        EmpCode: EmpCode,
        EmpName: EmpName,
        Mobile: Mobile,
        DOB: DOB,
        DOJ: DOJ,
        Salary: Salary,
        Address: Address,
        Remark: Remark,
      );

      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.addTodo(todo);

      Navigator.of(context).pop();
    }
  }
}
