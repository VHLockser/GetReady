import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:testelogin/admin/listagemdoadmin.dart';
import 'package:testelogin/pags/cron.dart';
import 'package:testelogin/pags/inicio.dart';
import 'package:flutter/src/widgets/text.dart';
import 'package:testelogin/pags/profile.dart';

import '../Service/Auth_Service.dart';
import '../main.dart';
import 'Autenticação/login_sereen.dart';
import 'IMC/bmi_screen.dart';


class Profile extends StatefulWidget{
  const Profile({Key key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Profile>{

  AuthClass authClass = AuthClass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.redAccent,
          title: Container(
            alignment: Alignment.center,
            child: Text(
                "GET READY",
                style: TextStyle(fontSize: 22, color: Colors.black87)
            ),
          )
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child:ListTile(
              leading: Container(
                width: 90.0,
                child: CircleAvatar(
                  backgroundColor: Colors.black87,
                  child: Image.asset(
                    'assets/images/logopng.png',
                    width: 150,
                    height: 150,
                  ),
                ),
              ),
              title: Text('Calculadora do IMC'.tr),
              onTap:(){
                Navigator.push(context, MaterialPageRoute(builder: (context) => BMI_Screen())
                );
              },
            ),
          ),
          Card(
            child:ListTile(
              leading: Container(
                width: 90.0,
                child: CircleAvatar(
                  backgroundColor: Colors.black87,
                  child: Image.asset(
                    'assets/images/logopng.png',
                    width: 150,
                    height: 150,
                  ),
                ),
              ),
              title: Text('Idioma'),
              onTap: () {
                buildLanguageDialog(context);
              },
            ),
          ),
          Card(
            child:ListTile(
              leading: Container(
                width: 90.0,
                child: CircleAvatar(
                  backgroundColor: Colors.black87,
                  child: Image.asset(
                    'assets/images/logopng.png',
                    width: 150,
                    height: 150,
                  ),
                ),
              ),
              title: Text('Sair'),
              onTap: () async {
                await authClass.signOut();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (builder) => LoginScreen()),
                        (route) => false);
              },
            ),
          ),

        ],
      ),
    );
  }

  final List locale =[
    {'name':'Português','locale': Locale('pt','BR')},
    {'name':'English','locale': Locale('en','US')},
  ];
  updateLanguage(Locale locale){
    Get.back();
    Get.updateLocale(locale);
  }
  buildLanguageDialog(BuildContext context){
    showDialog(context: context,
        builder: (builder){
          return AlertDialog(
            backgroundColor: Colors.blueGrey.shade700,
            title: Text('Escolhe o teu idioma'.tr),
            titleTextStyle: TextStyle(fontSize: 19.0,color: Colors.white),
            content: Container(
              width: double.maxFinite,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(child: Text(locale[index]['name'],style: TextStyle(color: Colors.white),),onTap: (){
                        print(locale[index]['name']);
                        updateLanguage(locale[index]['locale']);
                      },
                      ),
                    );
                  }, separatorBuilder: (context,index){
                return Divider(
                  color: Colors.redAccent,
                );
              }, itemCount: locale.length
              ),
            ),
          );
        }
    );
  }
}