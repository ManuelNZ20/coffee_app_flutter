import 'package:coffee_app_flutter/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
  GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen()),
  GoRoute(
    path: '/coffee_screen',
    name: CoffeeScreen.name,
    builder: (context,state)=> const CoffeeScreen()
  ),
  GoRoute(
    path: '/coffee_special_screen',
    name: CoffeeSpecialScreen.name,
    builder: (_,__)=> const CoffeeSpecialScreen()
  )
]);
