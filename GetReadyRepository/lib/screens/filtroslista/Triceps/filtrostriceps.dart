import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testelogin/screens/ListaWidget.dart';
import 'package:provider/provider.dart';
import 'package:testelogin/admin/provider/todos.dart';
import 'TricepsAvançado.dart';
import 'TricepsIniciante.dart';
import 'TricepsMedio.dart';

class TricepsLista extends StatefulWidget{
  const TricepsLista({Key key}) : super(key: key);

  @override
  _TTodoListWidget createState() => _TTodoListWidget();
}

class _TTodoListWidget extends State<TricepsLista> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TodosProvider>(context);
    var todos = provider.Triceps;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Container(
          alignment: Alignment.center,
          child: Text(
              "Exercícios de Triceps".tr,
              style: TextStyle(fontSize: 22, color: Colors.white)
          ),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            flex: 0,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20.0),
              height: 30.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    height: 10,
                    width: 160.0,
                    padding: const EdgeInsets.only(
                        top: 0.0, bottom: 0.0, right: 15.0, left: 15.0),
                    child: RaisedButton(
                      elevation: 0.0,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      padding: const EdgeInsets.only(
                          top: 5.0, bottom: 5.0, right: 0.0, left: 0.0),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TricepsBegginer()),
                        );
                      },
                      child: Column(
                        children: const <Widget>[
                          SizedBox(height: 1),
                          Text('Iniciante'),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 160.0,
                    padding: const EdgeInsets.only(
                        top: 0.0, bottom: 0.0, right: 15.0, left: 15.0),
                    child: RaisedButton(
                      elevation: 0.0,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      padding: const EdgeInsets.only(
                          top: 5.0, bottom: 5.0, right: 0.0, left: 0.0),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TricepsMedium()),
                        );
                      },
                      child: Column(
                        children: const <Widget>[
                          SizedBox(height: 1),
                          Text('Médio'),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 160.0,
                    padding: const EdgeInsets.only(
                        top: 0.0, bottom: 0.0, right: 15.0, left: 15.0),
                    child: RaisedButton(
                      elevation: 0.0,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      padding: const EdgeInsets.only(
                          top: 5.0, bottom: 5.0, right: 0.0, left: 0.0),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TricepsAdvanced()),
                        );
                      },
                      child: Column(
                        children: const <Widget>[
                          SizedBox(height: 1),
                          Text('Avançado'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),


          ),
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
