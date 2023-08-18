import 'package:coffee_app_flutter/presentation/providers/coffee_special_provider.dart';
import 'package:coffee_app_flutter/presentation/widgets/coffee/card_coffee_special.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../widgets/widgets.dart';

class CoffeeSpecialScreen extends StatelessWidget {
  static const String name = 'coffee_special_screen';
  const CoffeeSpecialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final coffeeSpecialProvider = context.watch<CoffeeSpecialProvider>();
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height * .4,
            decoration: BoxDecoration(
                color: Colors.yellow.shade700,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(180),
                    bottomRight: Radius.circular(180))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Coffee Special',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.favorite,
                  color: Colors.yellow.shade600,
                ),
                const Icon(
                  Icons.menu_book_rounded,
                  color: Color.fromARGB(255, 112, 68, 2),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ContainerPadding(
              child: SizedBox(
                  width: size.width,
                  height: size.height * .7,
                  child: ListView.builder(
                      itemCount: coffeeSpecialProvider.data.length,
                      itemBuilder: (context, index) {
                        if (coffeeSpecialProvider.data.isEmpty) {
                          return const Text('No Favorite Coffees');
                        }
                        final coffee = coffeeSpecialProvider.data[index];
                        return CardCoffeeSpecial(
                          name: coffee.name,
                          description: coffee.description,
                          price: coffee.price,
                          volume: coffee.volume,
                          imgUrl: coffee.imgUrl);
                      })),
            ),
          ),
          Align(
              alignment: Alignment.topLeft,
              child: SafeArea(
                  child: IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                      )))),
        ],
      ),
    );
  }
}
