import 'package:flutter/material.dart';

class ButtonSizeOption extends StatelessWidget {
  final String sizeText;
  final VoidCallback onPressed;
  final double size;
  const ButtonSizeOption(
      {super.key,
      required this.sizeText,
      required this.onPressed,
      this.size = 32});

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.hardEdge,
      color: Colors.yellow.shade700,
      borderRadius: BorderRadius.circular(50),
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Icon(
                Icons.free_breakfast_outlined,
                size: size,
              ),
              Positioned(
                left: sizeText.length.isOdd?10:8.5,
                bottom: 13,
                child: Text(
                  sizeText,
                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
