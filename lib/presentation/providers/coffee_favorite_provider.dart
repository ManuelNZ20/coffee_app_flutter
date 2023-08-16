import 'package:flutter/material.dart';

class CoffeeFavoriteProvider extends ChangeNotifier {
  final List<String> coffeeFavorites = [];
  void addFavorite(String name) {
    if(coffeeFavorites.contains(name)) {
      coffeeFavorites.remove(name);
    }else {
      coffeeFavorites.add(name);
    }
    notifyListeners();
  }
}
