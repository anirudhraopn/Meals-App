import 'package:flutter/material.dart';

import '../models/meals.dart';
import '../widgets/meal_item.dart';

class FavouritesPage extends StatelessWidget {
  final List<Meals> favouriteMeals;

  FavouritesPage(this.favouriteMeals);
  //const FavouritesPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    if (favouriteMeals.isEmpty) {
      return Center(
        child: Text('No Favourites added.. Try adding some!!'),
      );
    } else
      return Padding(
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
                      id: favouriteMeals[index].id,
                      affordability: favouriteMeals[index].affordability,
                      complexity: favouriteMeals[index].complexity,
                      duration: favouriteMeals[index].duration,
                      imageUrl: favouriteMeals[index].imageUrl,
                      title: favouriteMeals[index].title,
                    );
                  },
                  itemCount: favouriteMeals.length,
                )
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return MealItem(
                      id: favouriteMeals[index].id,
                      affordability: favouriteMeals[index].affordability,
                      complexity: favouriteMeals[index].complexity,
                      duration: favouriteMeals[index].duration,
                      imageUrl: favouriteMeals[index].imageUrl,
                      title: favouriteMeals[index].title,
                    );
                  },
                  itemCount: favouriteMeals.length,
                ));
  }
}
