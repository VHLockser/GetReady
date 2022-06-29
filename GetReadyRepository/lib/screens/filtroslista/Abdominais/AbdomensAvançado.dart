import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testelogin/screens/ListaWidget.dart';
import 'package:provider/provider.dart';
import 'package:testelogin/admin/provider/todos.dart';

import '../../ListaCompleta.dart';

class AbsAdvanced extends StatefulWidget{
  const AbsAdvanced ({Key key}) : super(key: key);

  @override
  _TTodoListWidget createState() => _TTodoListWidget();
}

class _TTodoListWidget extends State<AbsAdvanced> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TodosProvider>(context);
    var todos = provider.AbsAvancado;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Container(
          alignment: Alignment.center,
          child: Text(
              "Abdominais: Nível Avançado".tr,
              style: TextStyle(fontSize: 22, color: Colors.white)
          ),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child:ListView.separated(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(9),
              separatorBuilder: (context, index) => Container(height: 8),
              itemCount: todos.length,
              itemBuilder: (context, index) {
                var todo = todos[index];
                return TTodoWidget(todo: todo);
              },
            ), )
        ],
      ),




    );

  }
}
