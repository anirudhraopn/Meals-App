import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersPage extends StatefulWidget {
  //const FiltersPage({ Key? key }) : super(key: key);
  static const routeName = '/filters';
  Function saveFilters;
  Map<String, bool> currentFilters;

  FiltersPage(this.saveFilters, this.currentFilters);

  @override
  _FiltersPageState createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  var _isGlutenFree = false;
  var _isLactoseFree = false;
  var _isVegetarian = false;
  var _isVegan = false;

  initState() {
    super.initState();
    _isGlutenFree = widget.currentFilters['gluten'];
    _isLactoseFree = widget.currentFilters['lactose'];
    _isVegetarian = widget.currentFilters['vegetarian'];
    _isVegan = widget.currentFilters['vegan'];
  }

  Widget _buildListTileSwitch(
      String title, String subTitle, bool currentValue, Function _filter) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      onChanged: _filter,
      value: currentValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Filters'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _isGlutenFree,
                  'lactose': _isLactoseFree,
                  'vegetarian': _isVegetarian,
                  'vegan': _isVegan,
                };
                widget.saveFilters(selectedFilters);
              },
              icon: Icon(
                Icons.save,
              ))
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Filter the meals according to your needs',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildListTileSwitch(
                  'Is Gluten-Free',
                  'Only show gluten-free meals.',
                  _isGlutenFree,
                  (newValue) {
                    setState(
                      () {
                        _isGlutenFree = newValue;
                      },
                    );
                  },
                ),
                _buildListTileSwitch(
                  'Is Lactose-Free',
                  'Only show lactose-free meals.',
                  _isLactoseFree,
                  (newValue) {
                    setState(
                      () {
                        _isLactoseFree = newValue;
                      },
                    );
                  },
                ),
                _buildListTileSwitch(
                  'Is Vegetarian',
                  'Only show Vegetarian meals.',
                  _isVegetarian,
                  (newValue) {
                    setState(
                      () {
                        _isVegetarian = newValue;
                      },
                    );
                  },
                ),
                _buildListTileSwitch(
                  'Is Vegan',
                  'Only show vegan meals.',
                  _isVegan,
                  (newValue) {
                    setState(
                      () {
                        _isVegan = newValue;
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
