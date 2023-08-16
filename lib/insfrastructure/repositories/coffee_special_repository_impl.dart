import 'package:coffee_app_flutter/domain/datasources/coffee_special_datasources.dart';
import 'package:coffee_app_flutter/domain/entities/coffee_special.dart';
import 'package:coffee_app_flutter/domain/repositories/coffee_special_repository.dart';

class CoffeeSpecialRepositoryImpl extends CoffeeSpecialRepository {
  final CoffeeSpecialDataSource coffeeSpecial;

  CoffeeSpecialRepositoryImpl({required this.coffeeSpecial});
  @override
  Future<List<CoffeeSpecial>> getDataCoffeeByCompany() {
    return coffeeSpecial.getDataCoffeeSpecialByCompany();
  }

}