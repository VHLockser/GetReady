import 'package:flutter/material.dart';
import 'package:testelogin/treinos/costas.dart';
import 'package:testelogin/treinos/peito.dart';
import 'package:testelogin/treinos/triceps.dart';
import 'package:testelogin/treinos/biceps.dart';
import 'package:get/get.dart';

class CategoryListb extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.redAccent,
            title: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                  "Treinos Por Grupo Muscular".tr,
                  style: TextStyle(fontSize: 22, color: Colors.white)
              ),
            )
        ),
        body:
        Column(
            mainAxisSize: MainAxisSize.min,
            children: [/*
            Container(

              margin: EdgeInsets.symmetric(vertical: 20.0),
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
            ),*/
        Container(
        decoration: BoxDecoration(
        color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                  color: Colors.redAccent[200],
                  blurRadius: 10,
                  spreadRadius: 4,
                  offset: Offset(1, 2))
            ]
        ),
        margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 10.0),
        width: 500,
        height: 600,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index){
                  return
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Padding(
                          padding: const EdgeInsets.only(
                              left: 0.0, right: 0.0, top: 40.0, bottom: 0.0),
                          child: RaisedButton(
                              elevation: 0.0,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              padding: EdgeInsets.only(
                                  top: 0.0, bottom: 5.0, right: 0.0, left: 0.0),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Triceps())

                                );
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/exercicios/triceps.png',
                                    height: 110,
                                    width: 350,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Treino de Tríceps',
                                    style: TextStyle(fontSize: 20, color: Colors.white),
                                  )
                                ],
                              ),
                              textColor: Color(0xFF292929),
                              color: Colors.redAccent),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                              left: 0.0, right: 0.0, top: 40.0, bottom: 0.0),
                          child: RaisedButton(
                              elevation: 0.0,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              padding: EdgeInsets.only(
                                  top: 0.0, bottom: 5.0, right: 0.0, left: 0.0),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Biceps())

                                );
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/exercicios/biceps.png',
                                    height: 110,
                                    width: 350,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Treino de Biceps',
                                    style: TextStyle(fontSize: 20, color: Colors.white),
                                  )
                                ],
                              ),
                              textColor: Color(0xFF292929),
                              color: Colors.redAccent),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                              left: 0.0, right: 0.0, top: 40.0, bottom: 0.0),
                          child: RaisedButton(
                              elevation: 0.0,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              padding: EdgeInsets.only(
                                  top: 0.0, bottom: 5.0, right: 0.0, left: 0.0),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Peito())

                                );
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/exercicios/peitoss.png',
                                    height: 110,
                                    width: 350,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Treino de Peitos',
                                    style: TextStyle(fontSize: 20, color: Colors.white),
                                  )
                                ],
                              ),
                              textColor: Color(0xFF292929),
                              color: Colors.redAccent),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 0.0, right: 0.0, top: 40.0, bottom: 0.0),
                          child: RaisedButton(
                              elevation: 0.0,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              padding: EdgeInsets.only(
                                  top: 0.0, bottom: 5.0, right: 0.0, left: 0.0),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Costas())

                                );
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/exercicios/costas.png',
                                    height: 110,
                                    width: 350,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Treino de Costas',
                                    style: TextStyle(fontSize: 20, color: Colors.white),
                                  )
                                ],
                              ),
                              textColor: Color(0xFF292929),
                              color: Colors.redAccent),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    );
                }
            ),

          ],
        )
    ),
            ],
        )
    );
  }
}