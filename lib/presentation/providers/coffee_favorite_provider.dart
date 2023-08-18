import 'package:coffee_app_flutter/domain/entities/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeFavoriteProvider extends ChangeNotifier {
  final List<String> coffeeFavorites = [];
  final List<Coffee> coffee = [];

  void addFavorite(String name) {
    if (coffeeFavorites.contains(name)) {
      coffeeFavorites.remove(name);
    } else {
      coffeeFavorites.add(name);
    }
    notifyListeners();
  }

  void addFavorites(List<Coffee> listCoffee) {
      coffee.clear();
    if (coffeeFavorites.isNotEmpty) {
      for (int i = 0; i < coffeeFavorites.length; i++) {
        for (int j = 0; j < listCoffee.length; j++) {
          if (listCoffee.elementAt(j).name == coffeeFavorites.elementAt(i) &&
              !coffee.contains(listCoffee.elementAt(j))) {
            coffee.add(listCoffee.elementAt(j));
            break;
          }
        }
      }
    }
  }
}
