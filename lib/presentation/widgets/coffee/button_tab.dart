import 'package:flutter/material.dart';

class ButtonTab extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onPressed;
  final double elevation;
  final Color buttonColor;

  ButtonTab({
    super.key,
    required this.selected,
    required this.text,
    required this.onPressed,
    this.elevation = 5,
    color,
  }) : buttonColor = color ?? Colors.yellow.shade700;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: selected ? 1 : .5,
      child: InkWell(
        onTap: onPressed,
        child: Card(
          elevation: elevation,
          color: selected
              ? Colors.yellow.shade700
              : Colors.grey[350],
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
            child: Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}
