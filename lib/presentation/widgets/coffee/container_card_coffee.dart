import 'package:coffee_app_flutter/presentation/providers/coffee_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../screens/screens.dart';
import '../widgets.dart';


class ContainerCardCoffee extends StatelessWidget {
  const ContainerCardCoffee({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final coffee = context.watch<CoffeeProvider>();
    return StreamBuilder(
      initialData: coffee.listData,
      builder: (context, snapshot) {
        final dataCoffee = snapshot.data;
        if (dataCoffee!.isNotEmpty) {
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dataCoffee.length,
              itemBuilder: (context, index) {
                final coffe = dataCoffee[index];
                return CardCoffee(
                  name: coffe.name,
                  category: coffe.category,
                  price: coffe.price,
                  imgUrl: coffe.imgUrl,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailsScreenCoffee(
                        nameProduct: coffe.name,
                        category: coffe.category,
                        price: coffe.price,
                        imgUrl: coffe.imgUrl,
                        description: coffe.description,
                      );
                    }));
                  },
                );
              });
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
