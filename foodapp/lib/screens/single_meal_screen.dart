import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import "package:flutter/material.dart";
import "../widgets/dummy_data.dart";

class SingleMealScreen extends StatelessWidget {
  const SingleMealScreen({Key? key}) : super(key: key);
  static const route_name = "/single-meal";

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final String mealId = args["id"];
    final Color backgroundColor = args["backgroundColor"];
    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          title: Text(
            "French",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        body: Column(
          children: [
            Container(
                height: 300,
                width: double.infinity,
                child: Image.network(selectedMeal.imageUrl)),
            Text("Hello World")
          ],
        ));
  }
}
