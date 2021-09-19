// import 'dart:io';

import 'package:flutter/material.dart';

import './models/category.dart';
import './models/meals.dart';
import './pages/fliters_page.dart';
import './pages/meals_page.dart';
import './pages/tabs_page.dart';
import './pages/category_meals_page.dart';
import './pages/categories_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  //const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };
  List<Meals> _availableMeals = DUMMY_MEALS;
  List<Meals> _favouriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavourites(String mealId) {
    final existingIndex = _favouriteMeals.indexWhere((meal) {
      return meal.id == mealId;
    });
    if (existingIndex >= 0) {
      setState(() {
        _favouriteMeals.removeAt(existingIndex);
      });
    } else
      setState(
        () {
          _favouriteMeals
              .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
        },
      );
  }

  bool _isFavourite(String id) {
    return _favouriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: CategoriesPage(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsPage(_favouriteMeals),
        CategoryMealsPage.routeName: (ctx) =>
            CategoryMealsPage(_availableMeals),
        MealsPage.routeName: (ctx) =>
            MealsPage(_toggleFavourites, _isFavourite),
        FiltersPage.routeName: (ctx) => FiltersPage(_setFilters, _filters),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesPage());
      },
      title: 'Meals App',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                    title: TextStyle(
                  fontSize: 28,
                  fontFamily: 'Raleway',
                  //fontWeight: FontWeight.bold,
                ))),
        primarySwatch: Colors.red,
        accentColor: Colors.amber,
        fontFamily: 'Raleway',
        canvasColor: Colors.red[100],
        textTheme: ThemeData.light().textTheme.copyWith(
              // ignore: deprecated_member_use
              body1: TextStyle(
                color: Colors.black87,
              ),
              // ignore: deprecated_member_use
              body2: TextStyle(
                color: Colors.black87,
              ),
              // ignore: deprecated_member_use
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
    );
  }
}

// class MyHome extends StatefulWidget {
//   //const MyHome({Key? key}) : super(key: key);

//   @override
//   _MyHomeState createState() => _MyHomeState();
// }

// class _MyHomeState extends State<MyHome> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Meals App',
//         ),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Text('Coming Soon!!'),
//       ),
//     );
//   }
// }
