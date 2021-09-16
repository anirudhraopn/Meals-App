import 'package:flutter/material.dart';
import '../models/meals.dart';

class MealItem extends StatelessWidget {
  //const MealItem({ Key? key }) : super(key: key);

  final String imageUrl;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  MealItem({
    @required this.affordability,
    @required this.complexity,
    @required this.duration,
    @required this.imageUrl,
    @required this.title,
  });

  //void selectMeal(){

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.network(
                imageUrl,
                height: 250,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            )
          ],
        ),
      ),
    );
  }
}
