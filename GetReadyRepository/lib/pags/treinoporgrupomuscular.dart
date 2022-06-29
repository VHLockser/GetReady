import 'package:flutter/material.dart';
import 'package:testelogin/treinos/costas.dart';
import 'package:testelogin/treinos/peito.dart';
import 'package:testelogin/treinos/triceps.dart';
import 'package:testelogin/treinos/biceps.dart';
import 'package:get/get.dart';

import '../treinos/abdominais.dart';

class CategoryListb extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors:[
                      Colors.redAccent,
                      Colors.pinkAccent,
                    ]
                ),
              ),
            ),
            title: Container(
              alignment: Alignment.bottomLeft,
              child: Text(
                  "Treinos Por Grupo Muscular".tr,
                  style: TextStyle(fontSize: 22, color: Colors.white)
              ),
            )
        ),
        body:
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
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
                                          top: 0.0, bottom: 0.0, right: 0.0, left: 0.0),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => Triceps())

                                        );
                                      },

                                      textColor: Color(0xFF292929),
                                      color: Colors.redAccent,
                                    child: Ink(
                                      padding: const EdgeInsets.only(
                                          top: 0.0, bottom: 5.0, right: 0.0, left: 0.0),
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                            colors:[
                                              Colors.redAccent,
                                              Colors.pinkAccent,
                                            ]
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Image.asset(
                                            'assets/exercicios/triceps.png',
                                            height: 110,
                                            width: 350,
                                            fit: BoxFit.cover,
                                          ),
                                          SizedBox(height: 6),
                                          Text(
                                            'Treino de Tríceps'.tr,
                                            style: TextStyle(fontSize: 20, color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),

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
                                          top: 0.0, bottom: 0.0, right: 0.0, left: 0.0),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => Biceps())

                                        );
                                      },

                                      textColor: Color(0xFF292929),
                                      color: Colors.redAccent,
                                    child: Ink(
                                      padding: const EdgeInsets.only(
                                          top: 0.0, bottom: 5.0, right: 0.0, left: 0.0),
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                            colors:[
                                              Colors.redAccent,
                                              Colors.pinkAccent,
                                            ]
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Image.asset(
                                            'assets/exercicios/biceps.png',
                                            height: 110,
                                            width: 350,
                                            fit: BoxFit.cover,
                                          ),
                                          SizedBox(height: 6),
                                          Text(
                                            'Treino de Bíceps'.tr,
                                            style: TextStyle(fontSize: 20, color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
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
                                          top: 0.0, bottom: 0.0, right: 0.0, left: 0.0),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => Peito())

                                        );
                                      },

                                      textColor: Color(0xFF292929),
                                      color: Colors.redAccent,
                                    child: Ink(
                                      padding: const EdgeInsets.only(
                                          top: 0.0, bottom: 5.0, right: 0.0, left: 0.0),
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                            colors:[
                                              Colors.redAccent,
                                              Colors.pinkAccent,
                                            ]
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Image.asset(
                                            'assets/exercicios/peitoss.png',
                                            height: 110,
                                            width: 350,
                                            fit: BoxFit.cover,
                                          ),
                                          SizedBox(height: 6),
                                          Text(
                                            'Treino de Peitos'.tr,
                                            style: TextStyle(fontSize: 20, color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
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
                                          top: 0.0, bottom: 0.0, right: 0.0, left: 0.0),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => Costas())

                                        );
                                      },

                                      textColor: Color(0xFF292929),
                                      color: Colors.redAccent,
                                    child: Ink(
                                      padding: const EdgeInsets.only(
                                          top: 0.0, bottom: 5.0, right: 0.0, left: 0.0),
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                            colors:[
                                              Colors.redAccent,
                                              Colors.pinkAccent,
                                            ]
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Image.asset(
                                            'assets/exercicios/costas.png',
                                            height: 110,
                                            width: 350,
                                            fit: BoxFit.cover,
                                          ),
                                          SizedBox(height: 6),
                                          Text(
                                            'Treino de Costas'.tr,
                                            style: TextStyle(fontSize: 20, color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
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
                                        top: 0.0, bottom: 0.0, right: 0.0, left: 0.0),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => Abs())

                                      );
                                    },

                                    textColor: Color(0xFF292929),
                                    color: Colors.redAccent,
                                    child: Ink(
                                      padding: const EdgeInsets.only(
                                          top: 0.0, bottom: 5.0, right: 0.0, left: 0.0),
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                            colors:[
                                              Colors.redAccent,
                                              Colors.pinkAccent,
                                            ]
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Image.asset(
                                            'assets/exercicios/abs.png',
                                            height: 110,
                                            width: 350,
                                            fit: BoxFit.cover,
                                          ),
                                          SizedBox(height: 6),
                                          Text(
                                            'Treino de Abdominais'.tr,
                                            style: TextStyle(fontSize: 20, color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
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