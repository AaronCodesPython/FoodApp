import 'package:flutter/material.dart';
import 'package:foodapp/models/meal.dart';
import 'package:foodapp/widgets/dummy_data.dart';
import './screens/category_info_screen.dart';
import 'screens/category_info_screen.dart';
import "./screens/single_meal_screen.dart";
import "./screens/tabs_screen.dart";
import "./screens/filters_screen.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    "gluten": false,
    "lactose": false,
    "vegetarian": false,
    "vegan": false
  };

  List<Meal> availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;
      availableMeals = DUMMY_MEALS.where((meal) {
        if (filters["gluten"] as bool && !meal.isGlutenFree) {
          return false;
        }
        if (filters["lactose"] as bool && !meal.isLactoseFree) {
          return false;
        }
        if (filters["vegetarian"] as bool && !meal.isVegetarian) {
          return false;
        }
        if (filters["vegan"] as bool && !meal.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.yellow,
          canvasColor: const Color.fromRGBO(18, 18, 18, 1),
          fontFamily: "Raleway",
          textTheme: ThemeData.light().textTheme.copyWith(
              bodySmall: const TextStyle(color: Colors.black87, fontSize: 15),
              bodyMedium:
                  const TextStyle(color: Color.fromRGBO(220, 220, 220, 1)),
              titleMedium: const TextStyle(
                  fontSize: 24,
                  fontFamily: "RobotoCondensed",
                  color: Color.fromRGBO(250, 250, 220, 1),
                  fontWeight: FontWeight.bold)),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.yellow)
              .copyWith(secondary: Colors.amber)),
      //initialRoute: "/",
      routes: {
        "/": (ctx) => const TabsScreeen(),
        CategoryInfo.routeName: (ctx) => CategoryInfo(availableMeals),
        SingleMealScreen.routeName: (ctx) => const SingleMealScreen(),
        FilterScreen.routeName: (ctx) => FilterScreen(_setFilters, filters)
      },
    );
  }
}
