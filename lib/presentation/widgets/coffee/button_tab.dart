import 'package:flutter/material.dart';

class ButtonTab extends StatelessWidget {
  final String text;
  const ButtonTab({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      color: Colors.yellow.shade700,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14
          ),
        ),
      ),
    );
  }
}