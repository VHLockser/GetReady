import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testelogin/pags/IMC/bmi_screen.dart';
import 'package:testelogin/pags/treinoporgrupomuscular.dart';
import 'package:testelogin/pags/treinoprefeito.dart';
import 'package:testelogin/functions.dart';
import 'package:firebase_auth/firebase_auth.dart';

Functions func = Functions();

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
            backgroundColor: Colors.redAccent,
            title: Container(
              alignment: Alignment.bottomCenter,
              child: const Text(
                  "GET READY",
                  style: TextStyle(fontSize: 22, color: Colors.black87)
              ),
            )
        ),
        body: Container(

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
                      elevation: 0.0,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      padding: const EdgeInsets.only(
                          top: 0.0, bottom: 5.0, right: 0.0, left: 0.0),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CategoryLista()),
                        );
                      },
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
                            style: TextStyle(fontSize: 22, color: Colors.black87),
                          )
                        ],
                      ),
                      textColor: const Color(0xFF292929),
                      color: Colors.redAccent),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 0.0, right: 0.0, top: 40.0, bottom: 0.0),
                    child: RaisedButton(
                        elevation: 0.0,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        padding: const EdgeInsets.only(
                            top: 0.0, bottom: 5.0, right: 0.0, left: 0.0),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CategoryListb()),
                          );
                        },
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
                              style: TextStyle(fontSize: 22, color: Colors.black87),
                            )
                          ],
                        ),
                        textColor: const Color(0xFF292929),
                        color: Colors.redAccent),
                  ),
                ],
              )
            ],
          ),
        ),

    );
  }
}