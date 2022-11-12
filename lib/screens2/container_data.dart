import 'package:flutter/material.dart';

import 'font _style.dart';

class ContainerData extends StatelessWidget {
  ContainerData({required this.icon, required this.title});
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 80,
          color: Color(0xffd3e0dd),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: textStylemain,
        ),
      ],
    );
  }
}
