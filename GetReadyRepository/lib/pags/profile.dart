
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/text.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:testelogin/pags/Settings/ManageProfile.dart';

import '../Model/user.dart';
import '../Service/Auth_Service.dart';
import '../Service/authnotifier.dart';
import 'Autenticação/login_sereen.dart';
import 'IMC/bmi_screen.dart';


class Profile extends StatefulWidget{
  const Profile({Key key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Profile>{


  AuthClass authClass = AuthClass();
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

  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context);
    return Scaffold(
     backgroundColor: Colors.transparent,
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
      body: SingleChildScrollView(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Card(
              elevation: 0,
              margin: const EdgeInsets.only(
                top: 25,
                left: 80,
                right: 80,
              ),
              color: Colors.transparent,
              child: Container(
                width: 500,
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Color.fromRGBO(5, 22, 38, 1.0),
                ),

                child: ListTile(
                  title: Text(
                    "Get Ready",
                    style: TextStyle(fontSize: 20.0,
                        color: Colors.redAccent, fontWeight: FontWeight.bold)),
                  leading: CircleAvatar(
                    radius: 45.0 ,
                    backgroundImage: ExactAssetImage("assets/images/logo.png",
                    ),
                  ),
                ),
              ),

              ),
            const SizedBox(height: 15.0),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              color: Colors.redAccent,
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    gradient: LinearGradient(
                        colors:[
                          Colors.redAccent,
                          Colors.pinkAccent,
                        ]
                    ),
                  ),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.language, color: Colors.white),
                      title: Text("changelang".tr, style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                      trailing: Icon(Icons.keyboard_arrow_right,color: Colors.white,),
                      onTap: (){
                        buildLanguageDialog(context);
                      },
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      width: double.infinity,
                      height: 5.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(150.0),
                        color: Colors.white,
                      ),

                    ),
                    ListTile(
                      leading: Icon(Icons.align_vertical_bottom, color: Colors.white),
                      title: Text('Calculadora do IMC'.tr, style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                      trailing: Icon(Icons.keyboard_arrow_right,color: Colors.white,),
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => BMI_Screen())
                        );
                      },
                    ),

                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      width: double.infinity,
                      height: 5.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(150.0),
                        color: Colors.white,
                      ),

                    ),/*
                    ListTile(

                      key: Key(authNotifier.userDetails.uuid),
                      leading: Icon(Icons.lock_outline, color: Colors.white),
                      title: Text("Configurações".tr, style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                      trailing: Icon(Icons.keyboard_arrow_right,color: Colors.white,),
                      onTap: () => editUser(context, authNotifier.userDetails),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      width: double.infinity,
                      height: 5.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(150.0),
                        color: Colors.white,
                      ),

                    ),*/
                    ListTile(
                      leading: Icon(Icons.lock_outline, color: Colors.white),
                      title: Text("Sair".tr, style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                      trailing: Icon(Icons.keyboard_arrow_right,color: Colors.white,),
                      onTap: () async {
                        await authClass.signOut();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (builder) => LoginScreen()),
                                (route) => false);
                      },
                    ),
                  ],
                )
              ),
            ),
            SizedBox(height: 10.0,
            ),
            Container(
              width: 300,
                child: Text("Acerca de nós: \n\n Boas vindas, esta é uma aplicação desenvolvida por Francisco Santos e Vitor Valença como o projeto final do Curso de Informática do Agrupamento de Escolas da Batalha. Este projeto só foi possível ser realizado com a ajuda dos nossos professores acompanhadores Paulo Barreira e Ana Mafalda.".tr, textAlign: TextAlign.center , style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                )
            ),

          ],
        )
      ),
    );
  }
  void editUser(BuildContext context, Users users) => Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => EditUserPage(users: users),
    ),
  );
}