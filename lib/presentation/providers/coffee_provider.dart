import 'package:coffee_app_flutter/domain/entities/coffee.dart';
import 'package:coffee_app_flutter/insfrastructure/repositories/coffee_repository_impl.dart';
import 'package:flutter/material.dart';

class CoffeeProvider extends ChangeNotifier {
  final CoffeeRepositoryImpl coffeeRepositoryImpl;
  final List<Coffee> listData = [];

  CoffeeProvider({required this.coffeeRepositoryImpl});

  Future<void> addCoffeeData() async {
    listData.clear();
    final dataComplete = await coffeeRepositoryImpl.getDataCoffee();
    listData.addAll(dataComplete);
    notifyListeners();
  }

  Future<void> addCoffeeDataByCategory(String category) async {
    listData.clear();
    final dataComplete =
        await coffeeRepositoryImpl.getDataCoffeeByCategory(category);
    listData.addAll(dataComplete);
    notifyListeners();
  }


}
