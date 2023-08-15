import 'package:coffee_app_flutter/domain/datasources/coffee_datasources.dart';
import 'package:coffee_app_flutter/domain/entities/coffee.dart';
import 'package:coffee_app_flutter/domain/repositories/coffee_repository.dart';

class CoffeeRepositoryImpl extends CoffeeRepository {
  final CoffeeDataSource coffeeDataSource;

  CoffeeRepositoryImpl({required this.coffeeDataSource});

  @override
  Future<List<Coffee>> getDataCoffee() async {
    return coffeeDataSource.getDataCoffee();
  }

  @override
  Future<List<Coffee>> getDataCoffeeByCategory(String category) async {
    return coffeeDataSource.getDataCoffeeByCategory(category);

  }
}
