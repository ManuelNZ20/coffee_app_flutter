import 'dart:math' show Random;
import 'package:coffee_app_flutter/presentation/widgets/coffee/button_add_shopping.dart';
import 'package:flutter/material.dart';

import '../widgets.dart';

class CardCoffee extends StatelessWidget {
  final String name;
  final String category;
  final double price;
  final String imgUrl;
  final VoidCallback onPressed;
  const CardCoffee(
      {
      super.key,
      required this.name,
      required this.category,
      required this.price,
      required this.imgUrl,
      required this.onPressed
      });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
      width: size.width * .48,
      height: size.height * .3,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Image.asset(
                    width: size.width * .26,
                    height: size.height * .16,
                    imgUrl,
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.topRight,
                child: _TagsButton(),
              )
            ],
          ),
          TextInformation(category: category, name: name),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextPriceCoffee(price: price),
                ButtonAddShopping(
                  onPressed: onPressed,
                  icons: Icons.add_rounded,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}



class _TagsButton extends StatelessWidget {
  const _TagsButton();

  @override
  Widget build(BuildContext context) {
    final random = Random();
    return Container(
      width: 50,
      height: 30,
      decoration: const BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30))),
      child: Center(
          child: Text(
        '0x${random.nextInt(5) + 1}',
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      )),
    );
  }
}
