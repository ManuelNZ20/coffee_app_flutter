import 'package:coffee_app_flutter/config/helpers/router/app_router.dart';
import 'package:coffee_app_flutter/config/theme/app_theme.dart';
import 'package:coffee_app_flutter/insfrastructure/datasources/coffee_datasource_impl.dart';
import 'package:coffee_app_flutter/insfrastructure/datasources/coffee_special_datasource_impl.dart';
import 'package:coffee_app_flutter/insfrastructure/repositories/coffee_repository_impl.dart';
import 'package:coffee_app_flutter/insfrastructure/repositories/coffee_special_repository_impl.dart';
import 'package:coffee_app_flutter/presentation/providers/coffee_favorite_provider.dart';
import 'package:coffee_app_flutter/presentation/providers/coffee_provider.dart';
import 'package:coffee_app_flutter/presentation/providers/coffee_special_provider.dart';
import 'package:coffee_app_flutter/presentation/providers/toggle_color_button_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    //data ;)
    final CoffeeRepositoryImpl coffeeRepositoryImpl =
        CoffeeRepositoryImpl(coffeeDataSource: LocalCoffeeDataSourceImpl());
    final CoffeeSpecialRepositoryImpl coffeeSpecialRepositoryImpl = CoffeeSpecialRepositoryImpl(coffeeSpecial: LocalCoffeeSpecialDataSource());
    return MultiProvider(providers: [
      ChangeNotifierProvider(
          create: (_) =>
              CoffeeProvider(coffeeRepositoryImpl: coffeeRepositoryImpl)
                ..addCoffeeData()),
      ChangeNotifierProvider(create: (_) => CoffeeFavoriteProvider()),
      ChangeNotifierProvider(create: (_)=>ToggleButtonTabBar(),
      ),
      ChangeNotifierProvider(create: (_)=> CoffeeSpecialProvider(coffeeSpecialRepository: coffeeSpecialRepositoryImpl)..addDataCoffee())
    ], child: const MaterialAppTheme());
  }
}

class MaterialAppTheme extends StatelessWidget {
  const MaterialAppTheme({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().themeData(),
      routerConfig: appRouter,
    );
  }
}
