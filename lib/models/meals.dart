import 'package:flutter/foundation.dart';

enum Complexity { Simple, Challenging, Hard }

enum Affordability { Affordable, Pricey, Luxurious }

class Meals {
  final String id;
  final String title;
  final List<String> categories;
  final String imageUrl;
  final List<String> steps;
  final List<String> ingredients;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meals({
    @required this.affordability,
    @required this.categories,
    @required this.complexity,
    @required this.duration,
    @required this.id,
    @required this.imageUrl,
    @required this.ingredients,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetarian,
    @required this.steps,
    @required this.title,
  });
}
