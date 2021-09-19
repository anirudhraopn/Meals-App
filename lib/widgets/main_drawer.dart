import 'package:flutter/material.dart';
import '../pages/fliters_page.dart';

class MainDrawer extends StatelessWidget {
  //const MainDrawer({ Key? key }) : super(key: key);

  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: 'RobotoCondensed',
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            height: 150,
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            alignment: Alignment.centerLeft,
            child: Text(
              'Meals App',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
          buildListTile(
            'Categories',
            Icons.restaurant,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildListTile(
            'Filters',
            Icons.filter_alt,
            () {
              Navigator.of(context).pushReplacementNamed(FiltersPage.routeName);
            },
          ),
        ],
      ),
    );
  }
}
