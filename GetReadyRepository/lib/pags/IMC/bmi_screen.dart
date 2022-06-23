import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testelogin/pags/IMC/bmi_result_screen.dart';

class BMI_Screen extends StatefulWidget {
  @override
  _BMI_ScreenState createState() => _BMI_ScreenState();
}

class _BMI_ScreenState extends State<BMI_Screen>
{
  bool isMale = true;
  double height = 180.0;
  int weight = 40;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1.0),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 0, 0, 1.0),
        title: Text('Cálculo IMC'),
      ),
      body: Column(
        children: [

          /*Male or Female Section*/
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.male,
                              size: 100.0,
                              color: Colors.white,
                            ),
                            const SizedBox(height: 15.0,),
                            Text(
                              "HOMEM",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                          ]
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0,),
                          color: isMale? Colors.blue : Color.fromARGB(255, 16, 19, 35),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20.0,),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.female,
                              size: 100.0,
                              color: Colors.white,
                            ),
                            const SizedBox(height: 15.0,),
                            Text(
                              "MULHER",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                          ]
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0,),
                          color: !isMale? Colors.pink : Color.fromARGB(255, 16, 19, 35),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /*Height Section*/
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0,),
                  color: Color.fromARGB(255, 16, 19, 35),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "ALTURA".tr,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          Text(
                            "${height.round()}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 60.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(width: 5.0,),
                          const Text(
                            "CM",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Slider(
                        value: height,
                        min: 80.0,
                        max: 220.0,
                        onChanged:(value){
                          setState(() {
                            height = value;
                          });
                        },
                        activeColor: Color.fromARGB(255, 160, 161, 173),
                        inactiveColor: Color.fromARGB(255, 88, 89, 104),
                        thumbColor: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ]
                ),
              ),
            ),
          ),

          /*Weight and Age Section*/
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "PESO",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white.withOpacity(0.8),
                            ),
                          ),
                          Text(
                            "${weight}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 60.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    weight--;
                                  });
                                },
                                heroTag: 'Weight-',
                                mini: true,

                                child: const Icon(
                                  Icons.remove,

                                ),
                              ),
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    weight++;
                                  });
                                },
                                heroTag: 'Weight+',
                                mini: true,
                                child: Icon(
                                  Icons.add,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0,),
                        color: Color.fromARGB(255, 16, 19, 35),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20.0,),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "IDADE",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white.withOpacity(0.8),
                            ),
                          ),
                          Text(
                            "${age}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 60.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                                heroTag: 'age-',
                                mini: true,
                                child: const Icon(
                                  Icons.remove,
                                ),
                              ),
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                                heroTag: 'age+',
                                mini: true,
                                child: const Icon(
                                  Icons.add,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0,),
                        color: Color.fromARGB(255, 16, 19, 35),
                      ),

                    ),

                  ),

                ],
              ),
            )
          ),
          /*Calculate Button Section*/
          Container (
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Color.fromARGB(255, 166, 0, 0),
            ),
            width: 300.0,
            height: 55.0,
            child: MaterialButton(
              elevation: 10,
              onPressed: (){
                double result = weight / pow(height/100, 2);
                print(result.round());
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BMIResultScreen(
                      result: result,
                      age: age,
                      isMale: isMale,
                    ),
                  )
                );
              },
              child: const Text(
                "CALCULAR",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),

              ),

            ),

          ),
          SizedBox(height: 20.0,),
        ],

      ),

    );
  }
}
