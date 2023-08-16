import 'package:coffee_app_flutter/presentation/providers/coffee_provider.dart';
import 'package:coffee_app_flutter/presentation/screens/details_coffee/deTails_screen_coffee.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final coffee = context.watch<CoffeeProvider>();
    return SafeArea(
      child: Column(
        children: [
          AppBarHomeScreen(
            size: size,
            onPressedMenu: () {},
            onPressedShopping: () {},
          ),
          const TextSearchCoffee(),
          _TextTabView(
            titleTabs: 'Categories',
            onTap: coffee.addCoffeeData,
          ),
          RowTabs(
          ),
          Material(
            color: Colors.white,
            child: SizedBox(
                height: size.height * .352,
                child: StreamBuilder(
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
                )),
          ),
          _TextTabView(
            titleTabs: 'Special offer',
            onTap: () {},
          ),
          SizedBox(
            width: size.width,
            height: size.height * .25,
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        tileColor: Colors.red,
                        title: Text('$index'),
                      ),
                    )),
          )
        ],
      ),
    );
  }
}

class _TextTabView extends StatelessWidget {
  final String titleTabs;
  final VoidCallback onTap;
  const _TextTabView({required this.titleTabs, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      color: Colors.white,
      child: Container(
        width: size.width,
        height: size.height * .054,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextInformationDescription(text: titleTabs),
            ButtonAllTabs(onTap: onTap)
          ],
        ),
      ),
    );
  }
}

class AppBarHomeScreen extends StatelessWidget {
  final Size size;
  final VoidCallback onPressedMenu;
  final VoidCallback onPressedShopping;
  const AppBarHomeScreen(
      {super.key,
      required this.size,
      required this.onPressedMenu,
      required this.onPressedShopping});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height * .06,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: onPressedMenu, icon: Icon(Icons.menu_rounded)),
          SizedBox(
            width: 150,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              TextTitle(
                text: 'Coffee',
                colorText: Colors.yellow.shade700,
              ),
              TextTitle(
                text: 'Take',
              ),
            ]),
          ),
          IconButton(
              onPressed: onPressedShopping,
              icon: Icon(Icons.shopping_bag_outlined)),
        ],
      ),
    );
  }
}
