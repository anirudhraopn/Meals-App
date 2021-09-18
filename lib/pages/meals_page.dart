import 'dart:io';

import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';

class MealsPage extends StatefulWidget {
  // const MealsPage({ Key? key }) : super(key: key);
  static const routeName = '/meal-page';
  final Function favourite;
  final Function isFavourite;

  MealsPage(this.favourite, this.isFavourite);

  @override
  _MealsPageState createState() => _MealsPageState();
}

class _MealsPageState extends State<MealsPage> {
  var connected = false;

  Future<void> checkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        connected = true;
      }
    } on SocketException catch (_) {
      connected = false;
    }
  }

  Widget buildHeading(
    BuildContext context,
    String text,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer(Widget child, double height) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10)),
      height: height,
      width: 350,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: widget.isFavourite(mealId)
              ? Icon(Icons.star)
              : Icon(Icons.star_border),
          onPressed: () {
            widget.favourite(mealId);
          },
        ),
        appBar: AppBar(
          title: Text(selectedMeal.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: connected
                    ? Image.network(
                        selectedMeal.imageUrl,
                        fit: BoxFit.cover,
                      )
                    : Center(
                        child: Text('Unable to load image'),
                      ),
              ),
              buildHeading(context, 'Ingredients'),
              buildContainer(
                ListView.builder(
                  itemCount: selectedMeal.ingredients.length,
                  itemBuilder: (ctx, index) {
                    return Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Text(
                          selectedMeal.ingredients[index],
                        ),
                      ),
                    );
                  },
                ),
                150,
              ),
              buildHeading(context, 'Steps'),
              buildContainer(
                ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('${index + 1}'),
                          ),
                          title: Text('${selectedMeal.steps[index]}'),
                        ),
                        Divider(),
                      ],
                    );
                  },
                  itemCount: selectedMeal.steps.length,
                ),
                400,
              )
            ],
          ),
        ));
  }
}
