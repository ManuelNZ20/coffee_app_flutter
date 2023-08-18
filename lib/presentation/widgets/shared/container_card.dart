import 'package:flutter/material.dart';

class ContainerCardStyle extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final double borderRadius;
  final double paddingH;
  final double paddingV;
  const ContainerCardStyle({super.key,required this.child, required this.width, required this.height, required this.borderRadius, required this.paddingH, required this.paddingV});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: paddingH, vertical: paddingV),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 2),
                blurRadius: 10,
                color: Colors.grey.shade300)
          ]),
      width: width,
      height: height,
      child: child
    );
  }
}