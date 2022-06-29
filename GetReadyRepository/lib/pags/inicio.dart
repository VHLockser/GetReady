import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testelogin/pags/IMC/bmi_screen.dart';
import 'package:testelogin/pags/treinoporgrupomuscular.dart';
import 'package:testelogin/pags/TreinoPrefeitos/treinoprefeito.dart';

class Inicio extends StatefulWidget{
  const Inicio({Key key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Inicio>{



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            automaticallyImplyLeading: false,
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
              alignment: Alignment.bottomCenter,
              child: const Text(
                  "GET READY",
                  style: TextStyle(fontSize: 22, color: Colors.white)
              ),
            )
        ),
        body: Container(

          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(13),
          ),
          margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
          width: 500,
          height: 600,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Column(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Treinos'.tr,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF32303d))
                        .copyWith(color: Colors.black),
                  ),
                ],
              ),


              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                      elevation: 10.0,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      padding: const EdgeInsets.only(
                          top: 0.0, bottom: 0.0, right: 0.0, left: 0.0),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CategoryLista()),
                        );
                      },

                      textColor: const Color(0xFF292929),
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
                            'assets/exercicios/gym.jpg',
                            height: 150,
                            width: 350,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Treinos pré-feitos'.tr,
                            style: TextStyle(fontSize: 22, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                   RaisedButton(
                        elevation: 10.0,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        padding: const EdgeInsets.only(
                            top: 0.0, bottom: 0.0, right: 0.0, left: 0.0),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CategoryListb()),
                          );
                        },

                        textColor: const Color(0xFF292929),
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
                              'assets/exercicios/mus.webp',
                              height: 150,
                              width: 350,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Treinos por categoria muscular'.tr,
                              style: TextStyle(fontSize: 22, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                ],
              )
            ],
          ),
        ),

    );
  }
}