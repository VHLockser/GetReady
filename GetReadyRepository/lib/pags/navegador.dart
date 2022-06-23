import 'package:flutter/material.dart';
import 'package:testelogin/admin/api/firebase_api.dart';
import 'package:testelogin/admin/model/todo.dart';
import 'package:testelogin/admin/page/home_page.dart';
import 'package:testelogin/admin/provider/todos.dart';
import 'package:testelogin/admin/widget/todo_list_widget.dart';
import 'package:testelogin/pags/cron.dart';
import 'package:testelogin/pags/inicio.dart';
import 'package:testelogin/pags/profile.dart';
import 'package:testelogin/screens/ListaCompleta.dart';
import 'package:provider/provider.dart';
import 'package:testelogin/screens/filtroslista/Peito/filtropeito.dart';


class Home extends StatefulWidget{
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{

  int currenTab=1;
  static const List<Widget> screens = [
    TTodoListWidget(),
    Inicio(),
    CountdownPage(),
    Profile(),
    PeitoLista(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const Inicio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      StreamBuilder<List<Todo>>(
        stream: FirebaseApi.readTodos(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return buildText('Something Went Wrong Try later');
              } else {
                final todos = snapshot.data;

                final provider = Provider.of<TodosProvider>(context);
                provider.setTodos(todos);

                return screens[currenTab];
              }
          }
        },
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20),
        child: Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(20),
          color: Colors.red,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: currenTab == currenTab ? Colors.red: Colors.grey ,
            ),
            height:50,

            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MaterialButton(
                          minWidth: 80,
                          onPressed: (){
                            setState((){
                              currentScreen = TodoListWidget();
                              currenTab = 0;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/bib.png',
                                width: 30,
                                height: 30,
                                color: currenTab == 0 ? Colors.black : Colors.black,
                              ),
                            ],
                          ),
                        ),
                        MaterialButton(
                          minWidth: 80,
                          onPressed: (){
                            setState((){
                              currentScreen = Inicio();
                              currenTab = 1;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/corrida.png',
                                width: 30,
                                height: 30,
                                color: currenTab == 0 ? Colors.black : Colors.black,
                              ),
                            ],
                          ),
                        )
                      ]
                  ),
                  //Right Tab Bar Icons
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MaterialButton(

                          minWidth: 80,
                          onPressed: (){
                            setState((){
                              currentScreen = CountdownPage();
                              currenTab = 2;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/cronometro.png',
                                width: 30,
                                height: 30,
                                color: currenTab == 0 ? Colors.black: Colors.black,
                              ),
                            ],
                          ),
                        ),
                        MaterialButton(
                          minWidth: 80,
                          onPressed: (){
                            setState((){
                              currentScreen = Profile();
                              currenTab = 3;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/users.png',
                                width: 30,
                                height: 30,
                                color: currenTab == 0 ? Colors.black : Colors.black,
                              ),
                            ],
                          ),
                        )
                      ]
                  )
                ]
            ),
          ),
        ),
      ),
    );
  }
}