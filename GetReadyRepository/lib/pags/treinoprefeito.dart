import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testelogin/treinos/peromb.dart';
import 'package:testelogin/treinos/tripei.dart';
import 'package:testelogin/treinos/workout_screen.dart';
import 'package:testelogin/treinos/peromb.dart';

class CategoryLista extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Container(
            alignment: Alignment.bottomCenter,
            child: Text(
                "Treinos Pré-Feitos".tr,
                style: TextStyle(fontSize: 22, color: Colors.white)
            ),
          )
      ),
        body: Column(
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 0.0, right: 0.0, top: 10.0, bottom: 0.0),
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
                                  MaterialPageRoute(builder: (context) => Workout_Screen())

                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Image.asset(
                                  'assets/exercicios/tBeC.jpg',
                                  height: 110,
                                  width: 350,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(height: 6),
                                Text(
                                  'Biceps e Costas',
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
                                  MaterialPageRoute(builder: (context) =>Tripei())
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Image.asset(
                                  'assets/exercicios/tTeP.jpg',
                                  height: 110,
                                  width: 350,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Triceps e Peito',
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
                                  MaterialPageRoute(builder: (context) => Peromb())
                              );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Image.asset(
                                  'assets/exercicios/tPeO.jpg',
                                  height: 110,
                                  width: 350,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Pernas e Ombros',
                                  style: TextStyle(fontSize: 20, color: Colors.white),
                                )
                              ],
                            ),
                            textColor: Color(0xFF292929),
                            color: Colors.redAccent),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),

    );
  }
}