import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Duration duration = Duration(seconds: 4);

    Timer(duration, () {
      Navigator.of(context).pushReplacementNamed('bmi_home_page');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff679186),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: pi * 2),
              duration: Duration(milliseconds: 2000),
              builder: (context, double value, child) {
                return Column(
                  children: [
                    Transform.scale(
                      scale: value / 4,
                      child: Transform.rotate(
                        angle: value,
                        child: Transform.translate(
                          offset: Offset(value * 10, 0),
                          child: Image.asset(
                            'asset/logo.png',
                            scale: 3,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
