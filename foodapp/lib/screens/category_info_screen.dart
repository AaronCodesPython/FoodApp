import "package:flutter/material.dart";
import '../widgets/dummy_data.dart';
import "../widgets/meal_item.dart";
import "../models/meal.dart";

class CategoryInfo extends StatefulWidget {
  static const routeName = "/category_meals";

  const CategoryInfo({Key? key}) : super(key: key);

  @override
  State<CategoryInfo> createState() => _CategoryInfoState();
}

class _CategoryInfoState extends State<CategoryInfo> {
  late String catTitle;
  late Color backColor;
  late List<Meal> filteredMeals;
  bool _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      catTitle = routArgs["title"];
      final catId = routArgs["Id"];
      backColor = routArgs["bgColor"] as Color;
      filteredMeals = DUMMY_MEALS.where((item) {
        return item.categories.contains(catId);
      }).toList();
      _loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  //final categoryClickedID;
  void _removeMeal(String mealID) {
    setState(() {
      filteredMeals.removeWhere((element) => element.id == mealID);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(catTitle),
          backgroundColor: backColor,
          titleTextStyle: Theme.of(context).textTheme.titleMedium,
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: filteredMeals[index].id,
              title: filteredMeals[index].title,
              imageURL: filteredMeals[index].imageUrl,
              duration: filteredMeals[index].duration,
              complexity: filteredMeals[index].complexity,
              affordability: filteredMeals[index].affordability,
              backgroundColor: backColor,
              removeItem: _removeMeal,
            );
          },
          itemCount: filteredMeals.length,
        ));
  }
}
