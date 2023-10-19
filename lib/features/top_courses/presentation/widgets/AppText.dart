import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  double size;
  String text;
  Color color;
  TextAlign align;

  AppText(
      {Key? key,
      this.size = 16,
      required this.text,
      this.color = Colors.black54,
      this.align = TextAlign.left})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: align,
      text,
      style:
          TextStyle(color: color, fontSize: size, fontWeight: FontWeight.bold),
    );
  }
}
