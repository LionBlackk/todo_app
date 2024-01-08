import 'package:flutter/material.dart';

class DisplayWhiteText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;

  const DisplayWhiteText(
      {super.key,
      this.fontSize = 20,
      required this.text,
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: Colors.white,
        ));
  }
}
