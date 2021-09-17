// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:meals_app/pages/meals_page.dart';
import './pages/category_meals_page.dart';

import './pages/categories_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CategoriesPage(),
      routes: {
        CategoryMealsPage.routeName: (ctx) => CategoryMealsPage(),
        MealsPage.routeName: (ctx) => MealsPage(),
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
        primarySwatch: Colors.indigo,
        accentColor: Colors.amber,
        fontFamily: 'Raleway',
        canvasColor: Colors.indigo[100],
        textTheme: ThemeData.light().textTheme.copyWith(
              // ignore: deprecated_member_use
              body1: TextStyle(
                color: Colors.black87,
              ),
              // ignore: deprecated_member_use
              body2: TextStyle(
                color: Colors.black87,
              ),
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

class MyHome extends StatefulWidget {
  //const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Meals App',
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Coming Soon!!'),
      ),
    );
  }
}
