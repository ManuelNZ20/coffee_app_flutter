import 'package:flutter/material.dart';

class ButtonTab extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double elevation;
  const ButtonTab(
      {super.key,
      required this.text,
      required this.onPressed,
      this.elevation = 5});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        elevation: elevation,
        color: Colors.yellow.shade700,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
          child: Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
