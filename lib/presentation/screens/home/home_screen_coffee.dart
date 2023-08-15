import 'package:coffee_app_flutter/presentation/providers/coffee_provider.dart';
import 'package:coffee_app_flutter/presentation/screens/details_coffee/deTails_screen_coffee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final coffee = context.watch<CoffeeProvider>();
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50), child: AppBarHomeScreen()),
      body: SafeArea(
        child: ContainerPadding(
          child: Column(
            children: [
              const TextSearchCoffee(),
              _TextTabView(
                titleTabs: 'Categories',
                onTap: coffee.addCoffeeData,
              ),
              const RowTabs(),
              SizedBox(
                  height: 300,
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
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return DetailsScreenCoffee(
                                            nameProduct: coffe.name,
                                            category: coffe.category,
                                            price:coffe.price,
                                            imgUrl: coffe.imgUrl,
                                            description: coffe.description,
                                          );
                                      }));
                                },
                              );
                            });
                      }
                      return Center(child: const CircularProgressIndicator());
                    },
                  )),
              _TextTabView(
                titleTabs: 'Special offer',
                onTap: () {},
              ),
            ],
          ),
        ),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextInformationDescription(text: titleTabs),
        ButtonAllTabs(onTap: onTap)
      ],
    );
  }
}

class AppBarHomeScreen extends StatelessWidget {
  const AppBarHomeScreen({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading:
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu_rounded)),
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Coffee'),
          Text('Take'),
        ],
      ),
      actions: [
        IconButton(
            onPressed: () {}, icon: const Icon(MaterialCommunityIcons.shopping))
      ],
    );
  }
}
