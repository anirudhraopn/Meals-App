import 'dart:io';

import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/widgets/meal_item.dart';

import '../dummy_data.dart';

class CategoryMealsPage extends StatelessWidget {
  //const CategoryMealsPage({Key? key}) : super(key: key);

  final List<Meals> availableMeals;

  CategoryMealsPage(this.availableMeals);

  // CategoryMealsPage({
  //   required this.categoryId,
  //   required this.categoryTitle,
  // });

  static const routeName = '/category_meals';
  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String categoryId = routeArgs['id'];
    final String categoryTitle = routeArgs['title'];
    final categoryMeals = availableMeals
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: isLandscape
                ? GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 300,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemBuilder: (context, index) {
                      return MealItem(
                        id: categoryMeals[index].id,
                        affordability: categoryMeals[index].affordability,
                        complexity: categoryMeals[index].complexity,
                        duration: categoryMeals[index].duration,
                        imageUrl: categoryMeals[index].imageUrl,
                        title: categoryMeals[index].title,
                      );
                    },
                    itemCount: categoryMeals.length,
                  )
                : ListView.builder(
                    itemBuilder: (context, index) {
                      return MealItem(
                        id: categoryMeals[index].id,
                        affordability: categoryMeals[index].affordability,
                        complexity: categoryMeals[index].complexity,
                        duration: categoryMeals[index].duration,
                        imageUrl: categoryMeals[index].imageUrl,
                        title: categoryMeals[index].title,
                      );
                    },
                    itemCount: categoryMeals.length,
                  )));
  }
}
