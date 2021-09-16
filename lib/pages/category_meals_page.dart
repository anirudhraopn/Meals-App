import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/widgets/meal_item.dart';

import '../dummy_data.dart';

class CategoryMealsPage extends StatelessWidget {
  //const CategoryMealsPage({Key? key}) : super(key: key);

  // CategoryMealsPage({
  //   required this.categoryId,
  //   required this.categoryTitle,
  // });

  static const routeName = '/category_meals';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String categoryId = routeArgs['id'];
    final String categoryTitle = routeArgs['title'];
    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              affordability: categoryMeals[index].affordability,
              complexity: categoryMeals[index].complexity,
              duration: categoryMeals[index].duration,
              imageUrl: categoryMeals[index].imageUrl,
              title: categoryMeals[index].title,
            );
          },
          itemCount: categoryMeals.length,
        ));
  }
}
