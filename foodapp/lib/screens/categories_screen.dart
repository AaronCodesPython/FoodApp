import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import '../widgets/dummy_data.dart';
import '../widgets/categoryItem.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose your Food"),
      ),
      body: GridView(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          ...DUMMY_CATEGORIES
              .map((dataPoint) => categoryItem(
                    Id: dataPoint.id,
                    bgColor: dataPoint.bgColor,
                    title: dataPoint.title,
                  ))
              .toList()
        ],
      ),
    );
  }
}
