import 'package:coffee_app_flutter/presentation/screens/screens.dart';
import 'package:coffee_app_flutter/presentation/widgets/widgets.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String name = 'home_screen';
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      const ContainerPadding(child: HomeView()),
      const FavoriteView(),
      WidgetsView(),
      const PersonView()
    ];
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: SafeArea(
          child: Stack(
            children: [
              // body - information coffee
              Align(
                alignment: Alignment.topCenter,
                child: IndexedStack(
                  index: currentIndex,
                  children: screens,
                ),
              ),
              // bottomNavigatorBar - NavigatorBar
              Align(
                alignment: Alignment.bottomCenter,
                child: CurvedNavigationBar(
                  backgroundColor: Colors.transparent,
                  buttonBackgroundColor: Colors.yellow.shade700,
                  height: 55,
                  index: currentIndex,
                  items: const [
                    Icon(Icons.home_filled),
                    Icon(Icons.favorite_outline_rounded),
                    Icon(Icons.grid_view_outlined),
                    Icon(Icons.person_outline_rounded),
                  ],
                  onTap: (index) => setState(() => currentIndex = index),
                ),
              ),
            ],
          ),
        ));
  }
}
