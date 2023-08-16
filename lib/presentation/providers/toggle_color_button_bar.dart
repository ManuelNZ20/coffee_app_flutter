import 'package:coffee_app_flutter/domain/entities/coffe_category.dart';
import 'package:coffee_app_flutter/presentation/shared/data/coffee_data.dart';
import 'package:flutter/material.dart';

class ToggleButtonTabBar extends ChangeNotifier {
  List<CoffeeCategory> tabs = [];
  late TabController tabController;

  void init(TickerProvider ticker) {
    tabController = TabController(length: categoriesCoffee.length, vsync: ticker);
    for (int i = 0; i < categoriesCoffee.length; i++) {
      final category = categoriesCoffee[i];
      tabs.add(CoffeeCategory(categoryName: category, selected: i == 0));
    }
  }

  void onCategorySelected(int index) {
    final selected = tabs[index];
    for (int i = 0; i < tabs.length; i++) {
      tabs[i] = tabs[i].copyWith(selected.categoryName == tabs[i].categoryName);
    }
    notifyListeners();
  }
}
