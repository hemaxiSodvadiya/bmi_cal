import 'package:flutter/material.dart';

class ContainerView extends StatelessWidget {
  ContainerView({required this.containerColor, required this.childWidget});

  Color containerColor;
  @override
  final Widget childWidget;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: childWidget,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: containerColor,
        boxShadow: [
          BoxShadow(
            color: Color(0xffa2bdb6),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 0),
          ),
        ],
      ),
    );
  }
}
//0xff89aba2
