import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testelogin/treinos/peromb.dart';
import 'package:testelogin/treinos/tripei.dart';
import 'package:testelogin/treinos/workout_screen.dart';
import 'package:testelogin/treinos/peromb.dart';

class CategoryListaMedio extends StatelessWidget {


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
            alignment: Alignment.bottomLeft ,
            child: Text(
                "Treinos Pré-Feitos".tr,
                style: TextStyle(fontSize: 22, color: Colors.white)
            ),
          )
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height:8),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            height: 30.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[

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
                SizedBox(width: 10),
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
                SizedBox(width: 10),
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
                SizedBox(width: 12),
              ],
            ),

          ),
          Container(
            padding: const EdgeInsets.only(
                top: 0.0, bottom: 0.0, right: 0.0, left: 0.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(13),
            ),
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
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
                          left: 0.0, right: 0.0, top: 5.0, bottom: 0.0),
                      child: RaisedButton(
                        elevation: 10.0,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        padding: EdgeInsets.only(
                            top: 0.0, bottom: 0.0, right: 0.0, left: 0.0),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Workout_Screen())

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
                                'assets/exercicios/tBeC.jpg',
                                height: 110,
                                width: 350,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(height: 6),
                              Text(
                                'Iniciante: Bíceps e Costas'.tr,
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
                        elevation: 10.0,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        padding: EdgeInsets.only(
                            top: 0.0, bottom: 0.0, right: 0.0, left: 0.0),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>Tripei())
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
                                'assets/exercicios/tTeP.jpg',
                                height: 110,
                                width: 350,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Iniciante: Tríceps e Peito'.tr,
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
                        elevation: 10.0,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        padding: EdgeInsets.only(
                            top: 0.0, bottom: 0.0, right: 0.0, left: 0.0),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Peromb())
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
                                'assets/exercicios/tPeO.jpg',
                                height: 110,
                                width: 350,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Iniciante: Pernas e Ombros'.tr,
                                style: TextStyle(fontSize: 20, color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
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