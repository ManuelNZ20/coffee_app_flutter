import 'package:coffee_app_flutter/presentation/providers/coffee_special_provider.dart';
import 'package:coffee_app_flutter/presentation/widgets/coffee/card_coffee_special.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContainerCardCoffeeSpecial extends StatelessWidget {
  const ContainerCardCoffeeSpecial({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final coffeeSpecial = context.watch<CoffeeSpecialProvider>();
    return ListView.builder(
        itemCount: coffeeSpecial.data.length,
        itemBuilder: (context, index) {
          final coffeeSp = coffeeSpecial.data[index];
          return CardCoffeeSpecial(
              name: coffeeSp.name,
              description: coffeeSp.description,
              price: coffeeSp.price,
              volume: coffeeSp.volume,
              imgUrl: coffeeSp.imgUrl);
        });
  }
}
