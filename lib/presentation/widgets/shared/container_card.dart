import 'package:flutter/material.dart';

class ContainerCardStyle extends StatelessWidget {
  final Widget widget;
  final double width;
  final double height;
  const ContainerCardStyle({super.key,required this.widget, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 2),
                blurRadius: 10,
                color: Colors.grey.shade300)
          ]),
      width: width * .48,
      height: height * .3,
      child: widget
    );
  }
}