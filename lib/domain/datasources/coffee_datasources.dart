import 'package:coffee_app_flutter/domain/entities/coffee.dart';

abstract class CoffeeDataSource {
  Future<List<Coffee>> getDataCoffee();
  Future<List<Coffee>> getDataCoffeeByCategory(String category);
}