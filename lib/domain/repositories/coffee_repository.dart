import 'package:coffee_app_flutter/domain/entities/coffee.dart';

abstract class CoffeeRepository  {
  Future<List<Coffee>> getDataCoffee();
  Future<List<Coffee>> getDataCoffeeByCategory(String category);
}