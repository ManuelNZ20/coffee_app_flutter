import 'package:coffee_app_flutter/presentation/providers/coffee_favorite_provider.dart';
import 'package:coffee_app_flutter/presentation/providers/coffee_provider.dart';
import 'package:coffee_app_flutter/presentation/screens/details_coffee/details_screen_coffee.dart';
import 'package:coffee_app_flutter/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final coffeeFavorite = context.watch<CoffeeFavoriteProvider>();
    final coffee = context.watch<CoffeeProvider>();
    coffeeFavorite.addFavorites(coffee.listData);
    return Stack(
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
                'Favorite coffee',
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
                    itemCount: coffeeFavorite.coffee.length,
                    itemBuilder: (context, index) {
                      if (coffeeFavorite.coffee.isEmpty) {
                        return const Text('No Favorite Coffees');
                      }
                      final coffeeCard = coffeeFavorite.coffee[index];
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
        )
      ],
    );
  }
}
