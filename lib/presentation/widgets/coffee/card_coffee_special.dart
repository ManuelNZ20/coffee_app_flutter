import 'package:coffee_app_flutter/presentation/widgets/widgets.dart';
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
    return ContainerCardStyle(
      width: size.width,
      height: size.height * .2,
      borderRadius: 10,
      paddingH: 6,
      paddingV: 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                imgUrl,
                width: size.width * .38,
                height: size.height * .14,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name),
                SizedBox(
                    width: size.width * .36,
                    child: Text(
                      description,
                      textAlign: TextAlign.justify,
                      maxLines: 3,
                    )),
                Text('$price'),
                Row(
                  children: List.generate(
                      volume.toInt(),
                      (index) => Icon(
                            Icons.coffee,
                            size: size.width * .06,
                          )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
