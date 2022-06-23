import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testelogin/admin/api/firebase_api.dart';
import 'package:testelogin/admin/model/todo.dart';
import 'package:testelogin/admin/provider/todos.dart';
import 'package:testelogin/admin/widget/add_todo_dialog_widget.dart';
import 'package:testelogin/admin/widget/completed_list_widget.dart';
import 'package:testelogin/admin/widget/todo_list_widget.dart';

import '../../Service/Auth_Service.dart';
import '../../pags/Autenticação/login_sereen.dart';
import '../listagemdoadmin.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  AuthClass authClass = AuthClass();
  @override
  Widget build(BuildContext context) {

    final tabs = [
      TodoListWidget(),
      CompletedListWidget(),
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Gerenciar Exercícios"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout_outlined, color: Colors.white,),
            onPressed: () async {
              await authClass.signOut();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (builder) => LoginScreen()),
                      (route) => false);
            },
          ),
          // add more IconButton
        ],
      ),
      body: StreamBuilder<List<Todo>>(
        stream: FirebaseApi.readTodos(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return buildText('Something Went Wrong Try later');
              } else {
                final todos = snapshot.data;

                final provider = Provider.of<TodosProvider>(context);
                provider.setTodos(todos);

                return tabs[selectedIndex];
              }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.black,
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AddTodoDialogWidget(),
          barrierDismissible: false,
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}

Widget buildText(String text) => Center(
      child: Text(
        text,
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
