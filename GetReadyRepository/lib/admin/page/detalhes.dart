import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../model/todo.dart';

class App extends StatelessWidget {
  App(this.lista);
  final Todo lista;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 25,
            child: Container(
              alignment: Alignment.topCenter,
              height: size.height - 400,
              width: size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      alignment: Alignment.center,
                      fit: BoxFit.cover,
                      image: AssetImage(lista.imagem),
                  ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0),
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                height: size.height / 2,
                width: size.width,
                decoration: BoxDecoration(
                  color: Color(0xFF070713),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(34.0),
                    topRight: Radius.circular(34.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          height: 5,
                          width: 32 * 1.5,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFFF0202),
                                Color(0xFFFF0202),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            )
                            ,
                            borderRadius: BorderRadius.circular(3),
                          ),

                        ),
                      ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  lista.Nome.tr,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      // height: 38,
                      // letterSpacing: 20,
                      color: Color(0xFFefeff6))
                  ,
                ),
              ],
            ),
                      const SizedBox(
                        height: 16,
                      ),
                      TabTitle(label: 'Info+', selected: true),
                      const Spacing(),
                      Row(
                        children: [
                          RectButton(
                            label: lista.Nivel.tr,
                          ),
                          RectButton(
                            label: lista.Musculo.tr,
                          ),
                          RectButton(
                            label: lista.Rep,
                          ),
                        ],
                      ),
                      const Spacing(),
                      Row(
                        children: [
                          TabTitle(label: 'Descrição'.tr, selected: true),
                        ],
                      ),
                      const Spacing(),
                      Text(
                        lista.Informacao.tr,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            // letterSpacing: 20,
                            // height: 20,
                            color: Color(0xffb60000))
                            .copyWith(color: Colors.white),
                      ),
                      const Spacing(),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

class TabTitle extends StatelessWidget {
  final Todo lista;
  final String label;
  final bool selected;
  const TabTitle({
    Key key,
    @required this.label,
    @required this.selected,
    this.lista,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            label,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
                // letterSpacing: 20,
                // height: 20,
                color: Color(0xFF32303d))
                .copyWith(color: Colors.white),
          ),
          const SizedBox(
            height: 4,
          ),
          if (selected)
            Container(
              width: 340,
              height: 2,
              decoration: const BoxDecoration(color: Color(0xFFFD2929)),
            )
        ])
      ],
    );
  }
}

class Spacing extends StatelessWidget {
  final Todo lista;
  const Spacing({
    Key key,
    this.lista,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 16,
    );
  }
}

class RectButtonSelected extends StatelessWidget {
  final Todo lista;
  final String label;
  const RectButtonSelected({
    Key key,
    @required this.label,
    this.lista,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: const EdgeInsets.only(right: 14),
      height: 32,
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9), gradient: LinearGradient(
        colors: [
          Colors.white,
          Colors.redAccent,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )
      ),
      child: Center(
          child: Text(
            label,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                // letterSpacing: 20,
                // height: 20,
                color: Colors.black)
            ,
          )),
    );
  }
}

class RectButton extends StatelessWidget {
  final Todo lista;
  final String label;
  const RectButton({
    Key key,
    @required this.label,
    this.lista,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 14),
      height: 32,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.black,
          borderRadius: BorderRadius.circular(9),
          border: Border.all(color: Color(0xFFFF0000))
      ),
      child: Center(
          child: Text(
            label,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                // letterSpacing: 20,
                // height: 20,
                color: Color(0xFF32303d))
                .copyWith(color: Colors.white),
          )),
    );
  }
}


