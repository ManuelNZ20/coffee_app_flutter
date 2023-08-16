import 'package:coffee_app_flutter/domain/datasources/coffee_special_datasources.dart';
import 'package:coffee_app_flutter/domain/entities/coffee_special.dart';
import 'package:coffee_app_flutter/insfrastructure/models/coffee_special_model.dart';
import 'package:coffee_app_flutter/presentation/shared/data/coffee_special_data.dart';

class LocalCoffeeSpecialDataSource extends CoffeeSpecialDataSource {
  @override
  Future<List<CoffeeSpecial>> getDataCoffeeSpecialByCompany() async {
    final List<CoffeeSpecial> dataCoffee = dataCoffeeSpecial
        .map((e) => CoffeeSpecialModel.fromJson(e).toCoffeeSpecialEntity())
        .toList();
        return dataCoffee;
  }
}
