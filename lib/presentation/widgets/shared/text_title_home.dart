import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  final String text;
  final Color color;
  const TextTitle({super.key, required this.text, colorText})
      : color = colorText ?? Colors.black;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 20,
        fontWeight: FontWeight.bold),
    );
  }
}
