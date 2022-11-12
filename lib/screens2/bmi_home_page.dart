import 'dart:math';

import 'package:animation_bmi_calculator/screens2/result_screen.dart';
import 'package:flutter/material.dart';

import 'container_data.dart';
import 'container_view.dart';
import 'font _style.dart';
import 'model.dart';

const activeColor = Color(0xff425d56);
const inActiveColor = Color(0xffa2bdb6);

class BmiHomePage extends StatefulWidget {
  const BmiHomePage({Key? key}) : super(key: key);

  @override
  State<BmiHomePage> createState() => _BmiHomePageState();
}

class _BmiHomePageState extends State<BmiHomePage> {
  // Color maleBoxColor = activeColor;
  // Color femaleBoxColor = inActiveColor;

  Color maleBoxColor = activeColor;
  Color femaleBoxColor = inActiveColor;

  int height = 100;
  int weight = 30;
  int age = 18;
  int weightCount = 0;
  int ageCount = 0;
  int heightCount = 0;

  void updateGender(int gender) {
    if (gender == 1) {
      if (maleBoxColor == inActiveColor) {
        maleBoxColor = activeColor;
        femaleBoxColor = inActiveColor;
      } else {
        maleBoxColor = inActiveColor;
        femaleBoxColor = activeColor;
      }
    } else {
      if (femaleBoxColor == inActiveColor) {
        femaleBoxColor = activeColor;
        maleBoxColor = inActiveColor;
      } else {
        femaleBoxColor = inActiveColor;
        maleBoxColor = activeColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff679186),
        centerTitle: true,
        title: Text(
          "BMI Calculator",
          style: textStylemain,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateGender(1);
                      });
                    },
                    child: ContainerView(
                      containerColor: femaleBoxColor,
                      childWidget: TweenAnimationBuilder(
                        tween: Tween<double>(begin: 0, end: pi * 2),
                        duration: Duration(milliseconds: 3000),
                        builder: (context, double value, child) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Transform.scale(
                                scale: value / 7,
                                child: ContainerData(
                                    icon: Icons.female, title: "Female"),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateGender(2);
                      });
                    },
                    child: ContainerView(
                      containerColor: maleBoxColor,
                      childWidget: TweenAnimationBuilder(
                        tween: Tween<double>(begin: 0, end: pi * 2),
                        duration: Duration(milliseconds: 3000),
                        builder: (context, double value, child) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Transform.scale(
                                scale: value / 7,
                                child: ContainerData(
                                    icon: Icons.male, title: "Male"),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ContainerView(
                    containerColor: Color(0xff89aba2),
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Height",
                          style: textStylemain,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            TweenAnimationBuilder(
                              tween: Tween(begin: 0.0, end: 1.0),
                              key: Key(height.toString()),
                              duration: Duration(milliseconds: 700),
                              builder: (context, value, _) {
                                return Stack(
                                  children: [
                                    Opacity(
                                      opacity: 1 - value,
                                      child: Transform.translate(
                                        offset: Offset(50 * value, 0.0),
                                        child: Text(
                                          heightCount.toString(),
                                          style: textStylesub,
                                        ),
                                      ),
                                    ),
                                    Transform.translate(
                                      offset: Offset(-50 * (1 - value), 0.0),
                                      child: Text(
                                        height.toString(),
                                        style: textStylesub,
                                      ),
                                    )
                                  ],
                                );
                              },
                            ),
                            Text(
                              "cm",
                              style: textStylemain,
                            ),
                          ],
                        ),
                        Slider(
                          value: height.toDouble(),
                          min: 100,
                          max: 250,
                          activeColor: activeColor,
                          inactiveColor: inActiveColor,
                          onChanged: (double value) {
                            setState(() {
                              height = value.round();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ContainerView(
                    containerColor: Color(0xff89aba2),
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "weight",
                          style: textStylemain,
                        ),
                        // ),
                        // Text(
                        //   weight.toString(),
                        //   style: textStylesub,
                        // ),
                        Center(
                          child: TweenAnimationBuilder(
                            tween: Tween(begin: 0.0, end: 1.0),
                            key: Key(weight.toString()),
                            duration: Duration(milliseconds: 700),
                            builder: (context, value, _) {
                              return Stack(
                                children: [
                                  Opacity(
                                    opacity: 1 - value,
                                    child: Transform.translate(
                                      offset: Offset(50 * value, 0.0),
                                      child: Text(
                                        weightCount.toString(),
                                        style: textStylesub,
                                      ),
                                    ),
                                  ),
                                  Transform.translate(
                                    offset: Offset(-50 * (1 - value), 0.0),
                                    child: Text(
                                      weight.toString(),
                                      style: textStylesub,
                                    ),
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FloatingActionButton(
                              heroTag: '1',
                              backgroundColor: activeColor,
                              onPressed: () {
                                weightCount = weight;
                                setState(() {
                                  weightCount = weight;
                                  weight++;
                                });
                              },
                              child: Icon(
                                Icons.add,
                                color: inActiveColor,
                              ),
                            ),
                            FloatingActionButton(
                              heroTag: '2',
                              backgroundColor: activeColor,
                              onPressed: () {
                                setState(() {
                                  if (weight > 5) {
                                    weight--;
                                  }
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                color: inActiveColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ContainerView(
                    containerColor: Color(0xff89aba2),
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Age",
                          style: textStylemain,
                        ),
                        TweenAnimationBuilder(
                          tween: Tween(begin: 0.0, end: 1.0),
                          key: Key(age.toString()),
                          duration: Duration(milliseconds: 700),
                          builder: (context, value, _) {
                            return Stack(
                              children: [
                                Opacity(
                                  opacity: 1 - value,
                                  child: Transform.translate(
                                    offset: Offset(50 * value, 0.0),
                                    child: Text(
                                      ageCount.toString(),
                                      style: textStylesub,
                                    ),
                                  ),
                                ),
                                Transform.translate(
                                  offset: Offset(-50 * (1 - value), 0.0),
                                  child: Text(
                                    age.toString(),
                                    style: textStylesub,
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FloatingActionButton(
                              heroTag: '3',
                              backgroundColor: activeColor,
                              onPressed: () {
                                ageCount = age;
                                setState(() {
                                  age++;
                                });
                              },
                              child: Icon(
                                Icons.add,
                                color: inActiveColor,
                              ),
                            ),
                            FloatingActionButton(
                              heroTag: '4',
                              backgroundColor: activeColor,
                              onPressed: () {
                                setState(() {
                                  if (age > 1) {
                                    age--;
                                  }
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                color: inActiveColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              resultScreen(12.0);
            },
            child: Hero(
              tag: 'cal',
              placeholderBuilder: (context, size, _) {
                return CircularProgressIndicator();
              },
              flightShuttleBuilder: (context, animation, heroFlightDirection,
                  fromContext, toContext) {
                return Icon(
                  Icons.camera,
                  color: activeColor,
                );
              },
              child: Container(
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: activeColor,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xffa2bdb6),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                margin: EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    "Calculator",
                    style: textStylemain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void resultScreen(double result) {
    CalculatorBMI bmi = CalculatorBMI(height, weight, result, age.toString());
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ResultScreen(
                bmi.calculatorResult(), bmi.msg, bmi.descriptionView())));
  }
}
