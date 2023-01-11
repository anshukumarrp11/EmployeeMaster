import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_ui_ii_example/model/todo.dart';
import 'package:todo_app_ui_ii_example/provider/todos.dart';
import 'package:todo_app_ui_ii_example/widget/todo_form_widget.dart';

class EditTodoPage extends StatefulWidget {
  final Todo todo;

  const EditTodoPage({Key key, @required this.todo}) : super(key: key);

  @override
  _EditTodoPageState createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  final _formKey = GlobalKey<FormState>();

  String EmpCode;
  String EmpName;
  String Mobile;
  String DOB;
  String DOJ;
  String Salary;
  String Address;
  String Remark;

  @override
  void initState() {
    super.initState();

    EmpCode = widget.todo.EmpCode;
    EmpName = widget.todo.EmpName;
    Mobile = widget.todo.Mobile;
    DOB = widget.todo.DOB;
    DOJ = widget.todo.DOJ;
    Salary = widget.todo.Salary;
    Address = widget.todo.Address;
    Remark = widget.todo.Remark;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Edit Detail'),
          actions: [
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                final provider =
                    Provider.of<TodosProvider>(context, listen: false);
                provider.removeTodo(widget.todo);

                Navigator.of(context).pop();
              },
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: TodoFormWidget(
              EmpCode: EmpCode,
              EmpName: EmpName,
              Mobile: Mobile,
              DOB: DOB,
              DOJ: DOJ,
              Salary: Salary,
              Address: Address,
              Remark: Remark,
              onChangedEmpCode: (EmpCode) =>
                  setState(() => this.EmpCode = EmpCode),
              onChangedEmpName: (EmpName) =>
                  setState(() => this.EmpName = EmpName),
              onChangedMobile: (Mobile) => setState(() => this.Mobile = Mobile),
              onChangedDOB: (DOB) => setState(() => this.DOB = DOB),
              onChangedDOJ: (DOJ) => setState(() => this.DOJ = DOJ),
              onChangedSalary: (Salary) => setState(() => this.Salary = Salary),
              onChangedAddress: (Address) =>
                  setState(() => this.Address = Address),
              onChangedRemark: (Remark) => setState(() => this.Remark = Remark),
              onSavedTodo: saveTodo,
            ),
          ),
        ),
      );

  void saveTodo() {
    final isValid = _formKey.currentState.validate();

    if (!isValid) {
      return;
    } else {
      final provider = Provider.of<TodosProvider>(context, listen: false);

      provider.updateTodo(widget.todo, EmpCode, EmpName, Mobile, DOB, DOJ,
          Salary, Address, Remark);

      Navigator.of(context).pop();
    }
  }
}
