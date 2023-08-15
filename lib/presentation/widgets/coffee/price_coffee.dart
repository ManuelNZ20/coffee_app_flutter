import 'package:flutter/material.dart';

class TextPriceCoffee extends StatelessWidget {
  const TextPriceCoffee({
    super.key,
    required this.price,
  });

  final double price;

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$$price',
      style: const TextStyle(
          color: Color.fromARGB(255, 106, 61, 2),
          fontSize: 20,
          fontWeight: FontWeight.bold),
    );
  }
}
