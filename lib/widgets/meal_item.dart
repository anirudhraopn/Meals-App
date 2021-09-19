import 'dart:io';

import 'package:flutter/material.dart';
import 'package:meals_app/pages/meals_page.dart';
import '../models/meals.dart';

class MealItem extends StatefulWidget {
  //const MealItem({ Key? key }) : super(key: key);
  final String imageUrl;
  final String id;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  MealItem({
    @required this.id,
    @required this.affordability,
    @required this.complexity,
    @required this.duration,
    @required this.imageUrl,
    @required this.title,
  });

  @override
  _MealItemState createState() => _MealItemState();
}

class _MealItemState extends State<MealItem> {
  var connected = true;

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

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealsPage.routeName, arguments: widget.id);
  }

  String get complexityText {
    switch (widget.complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (widget.affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Expensive';
        break;
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return InkWell(
      onTap: () {
        selectMeal(context);
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: connected
                      ? isLandscape
                          ? Image.network(
                              widget.imageUrl,
                              height: MediaQuery.of(context).size.height * 0.6,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            )
                          : Image.network(
                              widget.imageUrl,
                              height:
                                  MediaQuery.of(context).size.height * 1 / 3,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            )
                      : Container(
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: Center(
                            child: Text('Unable to load image'),
                          ),
                        ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: 300,
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      widget.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text('${widget.duration} min'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text(affordabilityText),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
