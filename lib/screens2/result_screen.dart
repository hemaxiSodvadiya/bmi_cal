import 'package:flutter/material.dart';

import '../screens2/bmi_home_page.dart';
import '../screens2/font _style.dart';

class ResultScreen extends StatefulWidget {
  String view = "";
  String msg = "";
  String des = "";
  ResultScreen(this.view, this.msg, this.des);
  @override
  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff679186),
        centerTitle: true,
        title: Text("BMI Calculator Resuilt"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Hero(
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
              height: 550,
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: inActiveColor.withOpacity(0.05),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffa2bdb6),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 50,
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
                        "Result",
                        style: textStylemain,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Bmi :     ${widget.view}",
                          style: textStylemain,
                        ),
                        Text(
                          "Msg :    ${widget.msg}",
                          style: textStylemain,
                        ),
                        Text(
                          widget.des,
                          style: textStylemain,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 60,
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
                          "ReCalculator",
                          style: textStylemain,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
