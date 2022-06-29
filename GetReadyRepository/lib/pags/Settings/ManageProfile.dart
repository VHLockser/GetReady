import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testelogin/admin/model/todo.dart';
import 'package:testelogin/admin/provider/todos.dart';
import 'package:testelogin/admin/widget/todo_form_widget.dart';
import 'package:testelogin/pags/Settings/profilewidget.dart';

import '../../Model/user.dart';

class EditUserPage extends StatefulWidget {
  final Users users;

  const EditUserPage({Key key, @required this.users}) : super(key: key);

  @override
  _EditTodoPageState createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditUserPage> {
  final _formKey = GlobalKey<FormState>();

  String displayName;
  String email;
  String password;
  String phone;
  String Treino;
  String imagem;



  @override
  void initState() {
    super.initState();

    displayName = widget.users.displayName;
    email = widget.users.email;
    password = widget.users.password;
    phone = widget.users.phone;

  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Gerenciar Utilizador'),
    ),
    body: Padding(
      padding: EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: ProfileWidget(
          Nome: displayName,
          Email: email,
          onChangedNome: (displayName) => setState(() => this.displayName = displayName),
          onChangedEmail: (email) => setState(() => this.email = email),
          onChangedphone: (phone) => setState(() => this.phone = phone),
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

      provider.updateUser(widget.users, displayName, email, password, phone);

      Navigator.of(context).pop();
    }
  }

}
