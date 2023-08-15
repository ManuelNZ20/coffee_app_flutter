import 'package:flutter/material.dart';
class TextInformationDescription extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight font;
  const TextInformationDescription({super.key,required this.text,this.fontSize = 16,fontWeight}):font=fontWeight??FontWeight.bold;

  @override
  Widget build(BuildContext context) {
    return Text(
          text,
          style: TextStyle(fontWeight: font, fontSize: fontSize),
        );
  }
}