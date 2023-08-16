import 'package:coffee_app_flutter/domain/entities/coffee_special.dart';

class CoffeeSpecialModel {
  final String name;
  final String description;
  final double price;
  final double volume;
  final String imgUrl;

  CoffeeSpecialModel(
      {required this.name,
      required this.description,
      this.price = 0,
      this.volume = 0,
      required this.imgUrl});

  factory CoffeeSpecialModel.fromJson(Map<String, dynamic> json) =>
      CoffeeSpecialModel(
          name: json['name'] ?? 'No name',
          description: json['description'] ?? 'No description',
          price: json['price'] ?? 0.0,
          volume: json['volume'] ?? 0.0,
          imgUrl: json['imgUrl']);

  CoffeeSpecial toCoffeeSpecialEntity() => CoffeeSpecial(
      name: name,
      description: description,
      price: price,
      volume: volume,
      imgUrl: imgUrl);
}
