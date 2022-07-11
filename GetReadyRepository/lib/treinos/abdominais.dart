import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:testelogin/codsupl/round_info_container.dart';

import '../admin/model/todo.dart';
import '../admin/page/detalhes.dart';
import '../admin/provider/todos.dart';

class Abs extends StatefulWidget {

  const Abs({
    Key key,
  }) : super(key: key);

  @override
  _Workout_Screen createState() => _Workout_Screen();
}

class _Workout_Screen extends State<Abs>with TickerProviderStateMixin {

  AnimationController controller;

  bool isPlaying = false;

  String get countText {
    Duration count = controller.duration * controller.value;
    return controller.isDismissed
        ? '${(controller.duration.inMinutes % 60).toString().padLeft(2, '0')}:${(controller.duration.inSeconds % 60).toString().padLeft(2, '0')}'
        : '${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  double progress = 1.0;
  @override
  void initState() {

    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 45),
    );

    controller.addListener(() {
      if (controller.isAnimating) {
        setState(() {
          progress = controller.value;
        });
      } else {
        setState(() {
          progress = 1.0;
          isPlaying = false;
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.Abs;
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 370.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/exercicios/abs.png'),
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25.0),
                      bottomRight: Radius.circular(25.0),
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 10,
                  right: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.chevron_left),
                        iconSize: 30,
                        color: Colors.transparent,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.favorite),
                        iconSize: 30,
                        color: Colors.transparent,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 20.0,
                  left: 10,
                  right: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
                        child: Text(
                          'FULL - Abdominais\nTreino'.tr,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28.0,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RoundInfoContainer(
                            title: '1-2',
                            subtitle: 'Séries'.tr,
                          ),
                          _divider(),
                          RoundInfoContainer(
                            title: 'Get',
                            subtitle: 'Ready',
                          ),
                          _divider(),
                          RoundInfoContainer(
                            title: 'Dificuldade'.tr,
                            subtitle: 'Iniciante'.tr,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Exercicios'.tr, style: TextStyle(fontSize: 17.0),),
                  ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.red)
                            )
                        )

                    ),
                    onPressed: () {
                      if (controller.isAnimating) {
                        controller.stop();
                        setState(() {
                          isPlaying = false;
                        });
                      } else {
                        controller.reverse(
                            from: controller.value == 0 ? 1.0 : controller.value);
                        setState(() {
                          isPlaying = true;
                        });
                      }
                    },
                    child: Text(
                      countText,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                  Text('Info+',style: TextStyle(fontSize: 17.0),),
                ],
              ),
            ),
            Expanded(child:
            ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: todos.length,
              itemBuilder: (BuildContext context, int index){
                Todo dataexerc = todos[index];
                return Card(
                  child: ListTile(
                    isThreeLine: true,
                    leading: Container(
                      width: 90.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(dataexerc.imagem),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    title: Text(dataexerc.Nome.tr),
                    subtitle: Text(dataexerc.Nivel.tr),
                    trailing: Icon(Icons.arrow_forward_ios_rounded, color: Colors.red),
                    onTap:(){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder:(context) => App(dataexerc))
                      );
                    },
                  ),
                );
              },
            ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _divider(){
    return Container(
      width: 1.2,
      height: 35,
      color: Colors.white.withOpacity(.6),
    );
  }
}