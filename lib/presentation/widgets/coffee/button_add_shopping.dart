import 'package:flutter/material.dart';

class ButtonAddShopping extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icons;
  const ButtonAddShopping({super.key,required this.onPressed,required this.icons});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Material(
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.circular(50),
      color: Colors.amber,
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(2.8),
          child: Icon(
            icons,
            color: color.onPrimary,
          ),
        ),
      ),
    );
  }
}
