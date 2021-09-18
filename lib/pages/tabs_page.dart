import 'package:flutter/material.dart';

import '../models/meals.dart';
import '../widgets/main_drawer.dart';
import './categories_page.dart';
import './favourites_page.dart';

class TabsPage extends StatefulWidget {
  //const TabsPage({ Key? key }) : super(key: key);
  final List<Meals> favouriteMeals;
  TabsPage(this.favouriteMeals);

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  List<Map<String, Object>> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      {
        'page': CategoriesPage(),
        'title': 'Categories',
      },
      {
        'page': FavouritesPage(widget.favouriteMeals),
        'title': 'Your Favourites',
      },
    ];
  }

  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
    //print(_selectedPageIndex);
  }

  @override
  Widget build(BuildContext context) {
    print(_selectedPageIndex);
    return Scaffold(
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
            ),
            label: 'Favourites',
          ),
        ],
      ),
      appBar: AppBar(
        title: Text(
          _pages[_selectedPageIndex]['title'],
        ),
        centerTitle: true,
      ),
      body: _pages[_selectedPageIndex]['page'],
    );
  }
}
