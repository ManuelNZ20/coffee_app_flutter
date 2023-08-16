import 'package:coffee_app_flutter/domain/entities/coffee_special.dart';

abstract class CoffeeSpecialDataSource {
  Future<List<CoffeeSpecial>> getDataCoffeeSpecialByCompany();
}