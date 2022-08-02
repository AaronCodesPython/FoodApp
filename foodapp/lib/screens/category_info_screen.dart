import "package:flutter/material.dart";
import '../widgets/dummy_data.dart';
import "../widgets/meal_item.dart";

class category_info extends StatelessWidget {
  static const routeName = "/category_meals";
  //final categoryClickedID;
  //final categoryClickedTitle;
  //final bgColor;

  //category_info(
  //    this.categoryClickedID, this.categoryClickedTitle, this.bgColor);

  @override
  Widget build(BuildContext context) {
    final routArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final catTitle = routArgs["title"];
    final catId = routArgs["Id"];
    final backColor = routArgs["bgColor"] as Color;
    final filteredMeals = DUMMY_MEALS.where((item) {
      return item.categories.contains(catId);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(catTitle!),
          backgroundColor: backColor,
          titleTextStyle: Theme.of(context).textTheme.titleMedium,
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return mealItem(
                id: filteredMeals[index].id,
                title: filteredMeals[index].title,
                imageURL: filteredMeals[index].imageUrl,
                duration: filteredMeals[index].duration,
                complexity: filteredMeals[index].complexity,
                affordability: filteredMeals[index].affordability);
          },
          itemCount: filteredMeals.length,
        ));
  }
}
