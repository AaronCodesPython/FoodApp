import 'package:flutter/material.dart';
import '../widgets/dummy_data.dart';
import "../widgets/category_Item.dart";

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        ...DUMMY_CATEGORIES
            .map((dataPoint) => CategoryItem(
                  id: dataPoint.id,
                  bgColor: dataPoint.bgColor,
                  title: dataPoint.title,
                ))
            .toList()
      ],
    );
  }
}
