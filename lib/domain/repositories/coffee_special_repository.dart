import 'package:coffee_app_flutter/domain/entities/coffee_special.dart';

abstract class CoffeeSpecialRepository {
  Future<List<CoffeeSpecial>> getDataCoffeeByCompany();
}