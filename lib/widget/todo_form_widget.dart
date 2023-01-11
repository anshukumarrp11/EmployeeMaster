import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TodoFormWidget extends StatelessWidget {
  final String EmpCode;
  final String EmpName;
  final String Mobile;
  final String DOB;
  final String DOJ;
  final String Salary;
  final String Address;
  final String Remark;
  final ValueChanged<String> onChangedEmpCode;
  final ValueChanged<String> onChangedEmpName;
  final ValueChanged<String> onChangedMobile;
  final ValueChanged<String> onChangedDOB;
  final ValueChanged<String> onChangedDOJ;
  final ValueChanged<String> onChangedSalary;
  final ValueChanged<String> onChangedAddress;
  final ValueChanged<String> onChangedRemark;
  final VoidCallback onSavedTodo;
// (EmpCode, EmpName, Mobile, DOB, DOJ, Salary, Address,
// Remark)
  const TodoFormWidget({
    Key key,
    this.EmpCode = '',
    this.EmpName = '',
    this.Mobile = '',
    this.DOB = '',
    this.DOJ = '',
    this.Salary = '',
    this.Address = '',
    this.Remark = '',
    @required this.onChangedEmpCode,
    @required this.onChangedEmpName,
    @required this.onChangedMobile,
    @required this.onChangedDOB,
    @required this.onChangedDOJ,
    @required this.onChangedSalary,
    @required this.onChangedAddress,
    @required this.onChangedRemark,
    @required this.onSavedTodo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: [
            buildEmpCode(),
            SizedBox(height: 5),
            buildEmpName(),
            SizedBox(height: 5),
            buildMobile(),
            SizedBox(height: 5),
            buildDOB(),
            SizedBox(height: 5),
            buildDOJ(),
            SizedBox(height: 5),
            buildSalary(),
            SizedBox(height: 5),
            buildAddress(),
            SizedBox(height: 5),
            buildRemark(),
            SizedBox(height: 5),
            buildButton(),
          ],
        ),
      );

  Widget buildEmpCode() => TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        initialValue: EmpCode,
        onChanged: onChangedEmpCode,
        validator: (title) {
          if (title.isEmpty) {
            return 'This cannot be empty';
          }

          return null;
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Employee Code',
        ),
      );

  Widget buildEmpName() => TextFormField(
        maxLines: 1,
        initialValue: EmpName,
        onChanged: onChangedEmpName,
        validator: (name) {
          if (name.isEmpty) {
            return 'This cannot be empty';
          }
          return null;
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Employee Name',
        ),
      );

  Widget buildMobile() => TextFormField(
        maxLines: 1,
        maxLength: 10,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        initialValue: Mobile,
        onChanged: onChangedMobile,
        validator: (description) {
          if (description.isEmpty) {
            return 'This cannot be empty';
          }
          return null;
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Mobile no.',
        ),
      );

  Widget buildDOB() => TextFormField(
        maxLines: 1,
        maxLength: 10,
        keyboardType: TextInputType.datetime,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp('[0-9/]')),
        ],
        initialValue: DOB,
        onChanged: onChangedDOB,
        validator: (description) {
          if (description.isEmpty) {
            return 'This cannot be empty';
          }
          return null;
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Date of Birthday',
        ),
      );

  Widget buildDOJ() => TextFormField(
        maxLines: 1,
        maxLength: 10,
        keyboardType: TextInputType.datetime,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp('[0-9/]')),
          // FilteringTextInputFormatter.allow(filterPattern),
        ],
        initialValue: DOJ,
        onChanged: onChangedDOJ,
        validator: (title) {
          if (title.isEmpty) {
            return 'This cannot be empty';
          }
          return null;
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Date of Joining',
        ),
      );

  Widget buildSalary() => TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp('[0-9.]')),
        ],
        initialValue: Salary,
        onChanged: onChangedSalary,
        validator: (name) {
          if (name.isEmpty) {
            return 'This cannot be empty';
          }
          return null;
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Salary',
        ),
      );

  Widget buildAddress() => TextFormField(
        maxLines: 2,
        initialValue: Address,
        onChanged: onChangedAddress,
        validator: (description) {
          if (description.isEmpty) {
            return 'This cannot be empty';
          }
          return null;
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Address',
        ),
      );

  Widget buildRemark() => TextFormField(
        maxLines: 3,
        initialValue: Remark,
        onChanged: onChangedRemark,
        validator: (description) {
          if (description.isEmpty) {
            return 'This cannot be empty';
          }
          return null;
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Remark',
        ),
      );
  Widget buildButton() => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black),
          ),
          onPressed: onSavedTodo,
          child: Text('Save'),
        ),
      );
}
