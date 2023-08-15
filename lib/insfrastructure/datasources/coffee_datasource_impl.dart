import 'package:coffee_app_flutter/domain/datasources/coffee_datasources.dart';
import 'package:coffee_app_flutter/domain/entities/coffee.dart';
import 'package:coffee_app_flutter/insfrastructure/models/coffee_model.dart';
import 'package:coffee_app_flutter/presentation/shared/data/coffee_data.dart';

class LocalCoffeeDataSourceImpl extends CoffeeDataSource {
  @override
  Future<List<Coffee>> getDataCoffee() async {
    final List<Coffee> listCoffee = dataCoffee
        .map((coffee) => CoffeeModel.fromJson(coffee).toCoffeeEntity())
        .toList();
    return listCoffee;
  }

  @override
  Future<List<Coffee>> getDataCoffeeByCategory(String category) async {
    final List<Coffee> listCoffee = dataCoffee
        .map((coffee) => CoffeeModel.fromJson(coffee).toCoffeeEntity())
        .where((coffee) => coffee.category == category)
        .toList();
    return listCoffee;
  }
}
