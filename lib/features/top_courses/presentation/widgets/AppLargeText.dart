import 'package:flutter/material.dart';

class AppLargeText extends StatelessWidget {
  double size;
  String text;
  Color color;
  TextAlign align;

  AppLargeText(
      {Key? key,
      this.size = 20,
      required this.text,
      this.color = Colors.black,
      this.align = TextAlign.center})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: align,
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
