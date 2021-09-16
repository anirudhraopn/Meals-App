import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesPage extends StatelessWidget {
  //const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: ,
      appBar: AppBar(
        title: const Text(
          'Meals App',
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: GridView(
          padding: const EdgeInsets.all(15),
          children: DUMMY_CATEGORIES
              .map(
                (catData) =>
                    CategoryItem(catData.id, catData.title, catData.color),
              )
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
        ),
      ),
    );
  }
}
