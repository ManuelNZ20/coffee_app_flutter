import 'package:coffee_app_flutter/domain/entities/coffee.dart';

class CoffeeModel {
  final String name;
  final String category;
  final String description;
  final double price;
  final double volume;
  final String imgUrl;
  CoffeeModel(
      {required this.name,
      required this.category,
      required this.description,
      this.price = 0,
      this.volume = 0,
      required this.imgUrl});

  factory CoffeeModel.fromJson(Map<String, dynamic> json) => CoffeeModel(
      name: json['name'],
      category: json['category'],
      description: json['description'],
      price: json['price'],
      volume: json['volume'],
      imgUrl: json['imgUrl']);

  Coffee toCoffeeEntity() => Coffee(
      name: name,
      category: category,
      description: description,
      price: price,
      volume: volume,
      imgUrl: imgUrl);
}
