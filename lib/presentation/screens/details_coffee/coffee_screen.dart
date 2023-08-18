import 'package:coffee_app_flutter/presentation/providers/coffee_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../widgets/widgets.dart';
import '../screens.dart';

class CoffeeScreen extends StatelessWidget {
  static const String name = 'coffee_screen';
  const CoffeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final coffeeProvider = context.watch<CoffeeProvider>();
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
                  'Coffee',
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
                  Icons.coffee,
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
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 340,
                              mainAxisSpacing: 0,
                              crossAxisSpacing: 0,
                              childAspectRatio: 2 / 3.5),
                      itemCount: coffeeProvider.listData.length,
                      itemBuilder: (context, index) {
                        if (coffeeProvider.listData.isEmpty) {
                          return const Text('No Favorite Coffees');
                        }
                        final coffeeCard = coffeeProvider.listData[index];
                        return CardCoffee(
                            name: coffeeCard.name,
                            category: coffeeCard.category,
                            price: coffeeCard.price,
                            imgUrl: coffeeCard.imgUrl,
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return DetailsScreenCoffee(
                                    description: coffeeCard.description,
                                    imgUrl: coffeeCard.imgUrl,
                                    nameProduct: coffeeCard.name,
                                    category: coffeeCard.category,
                                    price: coffeeCard.price,
                                  );
                                },
                              ));
                            });
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
