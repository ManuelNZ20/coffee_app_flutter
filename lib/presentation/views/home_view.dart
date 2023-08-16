import 'package:coffee_app_flutter/presentation/providers/coffee_provider.dart';
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
          const RowTabs(),
          Material(
            color: Colors.white,
            child: SizedBox(
                height: size.height * .352,
                child: const ContainerCardCoffee()),
          ),
          _TextTabView(
            titleTabs: 'Special offer',
            onTap: () {},
          ),
          SizedBox(
            width: size.width,
            height: size.height * .25,
            child: ContainerCardCoffeeSpecial(),
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
