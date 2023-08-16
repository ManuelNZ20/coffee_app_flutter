import 'package:coffee_app_flutter/presentation/widgets/shared/container_padding.dart';
import 'package:flutter/material.dart';

class CardCoffeeSpecial extends StatelessWidget {
  final String name;
  final String description;
  final double price;
  final double volume;
  final String imgUrl;

  const CardCoffeeSpecial(
      {super.key,
      required this.name,
      required this.description,
      required this.price,
      required this.volume,
      required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10
      ),
      child: Card(
        clipBehavior: Clip.hardEdge,
        elevation: 3.5,
        margin: EdgeInsets.zero,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 18,horizontal: 14
          ),
          decoration: const BoxDecoration(
            color: Colors.white
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(
                  imgUrl,
                  width: size.width*.42,
                  height: size.height*.16,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
