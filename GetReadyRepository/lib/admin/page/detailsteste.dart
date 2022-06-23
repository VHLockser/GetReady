import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:testelogin/admin/model/todo.dart';


class DetalhesScreen extends StatelessWidget{
  final Todo lista;

  DetalhesScreen(this.lista);

  @override
  Widget build(BuildContext context){
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
                      image: AssetImage(lista.imagem),
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25.0),
                      bottomRight: Radius.circular(25.0),
                    ),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 1, sigmaY: 2),
                    child: Container(
                      color: Colors.white.withOpacity(.123),
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
                        color: Colors.black,
                        onPressed: () {
                        },
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 20.0,
                  left: 5,
                  right: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(2, 2, 2, 0.3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          lista.Nome,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28.0,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                lista.Informacao,
                style: TextStyle(fontSize: 22.0),
                textAlign: TextAlign.center,
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