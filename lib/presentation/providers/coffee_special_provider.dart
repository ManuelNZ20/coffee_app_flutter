import 'package:coffee_app_flutter/domain/entities/coffee_special.dart';
import 'package:coffee_app_flutter/domain/repositories/coffee_special_repository.dart';
import 'package:flutter/material.dart';

class CoffeeSpecialProvider extends ChangeNotifier{
  final CoffeeSpecialRepository coffeeSpecialRepository;
  final List<CoffeeSpecial> data = [];
  CoffeeSpecialProvider({required this.coffeeSpecialRepository});

  Future<void> addDataCoffee() async {
    final List<CoffeeSpecial> newData = await coffeeSpecialRepository.getDataCoffeeByCompany();
    data.addAll(newData);
    notifyListeners();
  }
}