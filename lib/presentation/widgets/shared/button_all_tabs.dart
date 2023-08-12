import 'package:flutter/material.dart';

class ButtonAllTabs extends StatelessWidget {
  final VoidCallback onTap;

  const ButtonAllTabs({
    super.key,
    required this.onTap
    });

  @override
  Widget build(BuildContext context) {
    final color = Colors.grey.shade500;
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Material(
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: onTap,
          child: Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'View all',
                  style: TextStyle(color: color),
                ),
                Container(
                  color: Colors.grey[350],
                  width: 47,
                  height: 2,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
