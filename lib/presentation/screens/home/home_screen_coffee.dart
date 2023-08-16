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
      const HomeView(),
      const FavoriteView(),
      const WidgetsView(),
      const PersonView()
    ];
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: ContainerPadding(
        child: IndexedStack(
          index: currentIndex,
          children: screens,
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.yellow.shade700,
        height: 48,
        index: currentIndex,
        items: const [
          Icon(Icons.home_filled),
          Icon(Icons.favorite_outline_rounded),
          Icon(Icons.grid_view_outlined),
          Icon(Icons.person_outline_rounded),
        ],
        onTap: (index) => setState(() => currentIndex = index),
      ),
    );
  }
}
