import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:testelogin/admin/model/todo.dart';
import 'package:testelogin/admin/page/edit_todo_page.dart';
import 'package:testelogin/admin/provider/todos.dart';
import 'package:testelogin/admin/utils.dart';

import '../admin/page/detalhes.dart';


class TTodoWidget extends StatelessWidget {
  final Todo todo;

  const TTodoWidget({
    @required this.todo,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(16),
    child: Slidable(
      actionPane: SlidableDrawerActionPane(),
      key: Key(todo.id),
      child: buildTodo(context),
    ),
  );

  Widget buildTodo(BuildContext context) => GestureDetector(
    child: Container(
      decoration: BoxDecoration(color: Color(0x8B070713)),
      padding: EdgeInsets.all(5),
      child: Row(
        children: [
          const SizedBox(width:2,),
          Expanded(
            child: ListTile(
              isThreeLine: true,
              leading: Container(
                width: 90.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  image: DecorationImage(
                    image: AssetImage(todo.imagem),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(todo.Nome.tr, style: TextStyle(color: Colors.white),),
              subtitle: Text(todo.Musculo.tr, style: TextStyle(color: Colors.white),),
              onTap:(){
                Navigator.push(context, MaterialPageRoute(builder: (context) => App(todo))
                );
              },
            ),
          ),
        ],
      ),
    ),
  );

  void deleteTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(todo);

    Utils.showSnackBar(context, 'Deleted the task');
  }

  void editTodo(BuildContext context, Todo todo) => Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => EditTodoPage(todo: todo),
    ),
  );
}
