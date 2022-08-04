import 'package:flutter/material.dart';
import './screens/category_info_screen.dart';
import 'screens/category_info_screen.dart';
import "./screens/single_meal_screen.dart";
import "./screens/tabs_screen.dart";
import "./screens/filters_screen.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
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
        CategoryInfo.routeName: (ctx) => const CategoryInfo(),
        SingleMealScreen.routeName: (ctx) => const SingleMealScreen(),
        FilterScreen.routeName: (ctx) => const FilterScreen()
      },
    );
  }
}
