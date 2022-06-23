import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testelogin/screens/ListaWidget.dart';
import 'package:provider/provider.dart';
import 'package:testelogin/admin/provider/todos.dart';
import 'package:testelogin/screens/filtroslista/Biceps/filtrobiceps.dart';
import 'package:testelogin/screens/filtroslista/Peito/filtropeito.dart';

import 'filtroslista/Costas/filtrocostas.dart';
import 'filtroslista/Ombros/filtrosombros.dart';
import 'filtroslista/Triceps/filtrostriceps.dart';

class TTodoListWidget extends StatefulWidget{
  const TTodoListWidget({Key key}) : super(key: key);

  @override
  _TTodoListWidget createState() => _TTodoListWidget();
}

class _TTodoListWidget extends State<TTodoListWidget> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TodosProvider>(context);
    var todos = provider.todos;

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.redAccent,
          title: Container(
            alignment: Alignment.center,
            child: Text(
                "Biblioteca de Exercícios".tr,
                style: TextStyle(fontSize: 22, color: Colors.white)
            ),
          ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu_book, color: Colors.white,),

          ),
          // add more IconButton
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(
            height: 16,
          ),
          Container(
            width: 360,
            height: 2,
            decoration: const BoxDecoration(color: Color(0xFFFD2929)),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Musculos'.tr,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Color(0xFF32303d))
                .copyWith(color: Colors.black),
          ),
          Expanded(
            flex: 0,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              height: 30.0,
              child: ListView(
                scrollDirection: Axis.horizontal,

                children: <Widget>[
                  SizedBox(width: 12),
                Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
              color: Color.fromARGB(255, 166, 0, 0),
            ),
            width: 130.0,
            height: 55.0,
            child: MaterialButton(
              elevation: 10,
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PeitoLista(),)
                );
              },
              child: const Text(
                "Peito",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),

              ),

            ),

          ),
                  SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color.fromARGB(255, 166, 0, 0),
                    ),
                    width: 130.0,
                    height: 55.0,
                    child: MaterialButton(
                      elevation: 10,
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BicepsLista(),)
                        );
                      },
                      child: const Text(
                        "Biceps",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),

                      ),

                    ),

                  ),
                  SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color.fromARGB(255, 166, 0, 0),
                    ),
                    width: 130.0,
                    height: 55.0,
                    child: MaterialButton(
                      elevation: 10,
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CostasLista(),)
                        );
                      },
                      child: const Text(
                        "Costas",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),

                      ),

                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color.fromARGB(255, 166, 0, 0),
                    ),
                    width: 130.0,
                    height: 55.0,
                    child: MaterialButton(
                      elevation: 10,
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OmbrosLista(),)
                        );
                      },
                      child: const Text(
                        "Ombros",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),

                      ),

                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color.fromARGB(255, 166, 0, 0),
                    ),
                    width: 130.0,
                    height: 55.0,
                    child: MaterialButton(
                      elevation: 10,
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TricepsLista(),)
                        );
                      },
                      child: const Text(
                        "Triceps",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),

                      ),

                    ),
                  ),
                  SizedBox(width: 12),
              ],
            ),

          ),


      ),
          Container(
            width: 340,
            height: 2,
            decoration: const BoxDecoration(color: Color(0xFFFD2929)),
          ),
          const SizedBox(
            height: 8,
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
          ),
          )
        ],
      ),




    );

  }
}
