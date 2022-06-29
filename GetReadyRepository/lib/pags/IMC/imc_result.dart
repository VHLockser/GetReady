import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretty_gauge/pretty_gauge.dart';

class ScoreScreen extends StatelessWidget {
  final double bmiScore;

  final int age;

  String bmiStatus;

  String bmiInterpretation;

  Color bmiStatusColor;

  ScoreScreen({Key key, @required this.bmiScore, @required this.age})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    setBmiInterpretation();
    return Scaffold(
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
                "Resultado do IMC".tr,
                style: TextStyle(fontSize: 22, color: Colors.white)
            ),
          )
      ),
      body: Container(
          padding: const EdgeInsets.all(12),
          child: Card(
              elevation: 0,
              shape: const RoundedRectangleBorder(),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text(
                      "Resultado".tr,
                      style: TextStyle(fontSize: 30, color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    PrettyGauge(
                      gaugeSize: 300,
                      minValue: 0,
                      maxValue: 40,
                      segments: [
                        GaugeSegment('Abaixo do Peso.'.tr, 18.5, Colors.red),
                        GaugeSegment('Normal'.tr, 6.4, Colors.green),
                        GaugeSegment('Acima do Peso'.tr, 5, Colors.orange),
                        GaugeSegment('Obeso'.tr, 10.1, Colors.pink),
                      ],
                      valueWidget: Text(
                        bmiScore.toStringAsFixed(1),
                        style: const TextStyle(fontSize: 40),
                      ),
                      currentValue: bmiScore.toDouble(),
                      needleColor: Colors.blue,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      bmiStatus,
                      style: TextStyle(fontSize: 24, color: bmiStatusColor,fontWeight: FontWeight.bold,),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 400,
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        bmiInterpretation,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,),
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Calcule Novamente.".tr,style: TextStyle(fontSize: 22, color: Colors.white),)),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    )
                  ]))),
    );
  }

  void setBmiInterpretation() {
    if (bmiScore > 30) {
      bmiStatus = "Obeso".tr;
      bmiInterpretation = "Por Favor comece a treinar ou uma dieta para reduzir a obesidade.".tr;
      bmiStatusColor = Colors.pink;
    } else if (bmiScore >= 25) {
      bmiStatus = "Acima do Peso".tr;
      bmiInterpretation = "Faça exercícios regularmente, como 4 ou 5 vezes na semana para perder peso.".tr;
      bmiStatusColor = Colors.orange;
    } else if (bmiScore >= 18.5) {
      bmiStatus = "Normal".tr;
      bmiInterpretation = "Aproveite, de acordo com seu Índice de Massa Coporal você está em boa forma!".tr;
      bmiStatusColor = Colors.green;
    } else if (bmiScore < 18.5) {
      bmiStatus = "Abaixo do Peso".tr;
      bmiInterpretation = "Tente aumentar seu peso com treinos e uma boa alimentação.".tr;
      bmiStatusColor = Colors.red;
    }
  }
}