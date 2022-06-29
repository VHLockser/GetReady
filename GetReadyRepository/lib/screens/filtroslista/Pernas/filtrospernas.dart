import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testelogin/screens/ListaWidget.dart';
import 'package:provider/provider.dart';
import 'package:testelogin/admin/provider/todos.dart';
import 'package:testelogin/screens/filtroslista/Peito/PeitoAvan%C3%A7ado.dart';
import 'package:testelogin/screens/filtroslista/Peito/PeitoIniciante.dart';
import 'package:testelogin/screens/filtroslista/Peito/PeitoMedio.dart';

import '../../ListaCompleta.dart';
import 'PernasAvançado.dart';
import 'PernasIniciante.dart';
import 'PernasMedio.dart';

class PernasLista extends StatefulWidget{
  const PernasLista({Key key}) : super(key: key);

  @override
  _TTodoListWidget createState() => _TTodoListWidget();
}

class _TTodoListWidget extends State<PernasLista> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TodosProvider>(context);
    var todos = provider.Pernas;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Container(
          alignment: Alignment.center,
          child: Text(
              "Exercícios de Pernas".tr,
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
                  SizedBox(width: 12),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors:[
                            Color.fromRGBO(218, 37, 96, 1.0),
                            Color.fromRGBO(255, 49, 49, 1.0),
                          ]
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                    width: 130.0,
                    height: 55.0,
                    child: MaterialButton(
                      elevation: 10,
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PernasBegginer(),)
                        );
                      },
                      child: Text(
                        "Iniciante".tr,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors:[
                            Color.fromRGBO(218, 37, 96, 1.0),
                            Color.fromRGBO(255, 49, 49, 1.0),
                          ]
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                    width: 130.0,
                    height: 55.0,
                    child: MaterialButton(
                      elevation: 10,
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PernasMedium(),)
                        );
                      },
                      child: Text(
                        "Intermediário".tr,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors:[
                            Color.fromRGBO(218, 37, 96, 1.0),
                            Color.fromRGBO(255, 49, 49, 1.0),
                          ]
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                    width: 130.0,
                    height: 55.0,
                    child: MaterialButton(
                      elevation: 10,
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PernasAdvanced(),)
                        );
                      },
                      child: Text(
                        "Avançado".tr,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
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
