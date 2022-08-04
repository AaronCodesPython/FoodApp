import "package:flutter/material.dart";
import '../models/meal.dart';
import "../screens/single_meal_screen.dart";

class MealItem extends StatelessWidget {
  final String title;
  final String id;
  final String imageURL;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Color backgroundColor;
  final Function removeItem;

  // ignore: use_key_in_widget_constructors
  const MealItem(
      {required this.title,
      required this.id,
      required this.imageURL,
      required this.duration,
      required this.complexity,
      required this.affordability,
      required this.backgroundColor,
      required this.removeItem});

  String get complexityText {
    switch (complexity) {
      case Complexity.beginner:
        return "Beginner";
      case Complexity.intermediate:
        return "Intermediate";
      case Complexity.expert:
        return "Expert";
      case Complexity.chefcook:
        return "Chefcook";
      default:
        return "Error";
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.reallyaffordable:
        return "\$";
      case Affordability.affordable:
        return "\$\$";
      case Affordability.medium:
        return "\$\$\$";
      case Affordability.pricey:
        return "\$\$\$\$";
      case Affordability.reallypricey:
        return "\$\$\$\$\$";
      default:
        return "Error! :O";
    }
  }

  void selectMeal(BuildContext context) {
    Map<String, dynamic> args = {"id": id, "backgroundColor": backgroundColor};

    Navigator.of(context)
        .pushNamed(SingleMealScreen.routeName, arguments: args)
        .then((result) {
      if (result != null) {
        removeItem(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => selectMeal(context),
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 4,
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      child: Image.network(imageURL,
                          height: 250,
                          width: double.infinity,
                          fit: BoxFit.cover),
                    ),
                    Positioned(
                      bottom: 20,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 20),
                        color: Colors.black54,
                        width: 300,
                        child: Text(
                          title,
                          style: const TextStyle(
                              fontSize: 26, color: Colors.white),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.access_time_filled),
                          const SizedBox(width: 6),
                          Text("$duration min",
                              style: Theme.of(context).textTheme.bodySmall)
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.work),
                          const SizedBox(width: 6),
                          Text(complexityText,
                              style: Theme.of(context).textTheme.bodySmall)
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.account_balance_wallet),
                          const SizedBox(width: 6),
                          Text(affordabilityText,
                              style: Theme.of(context).textTheme.bodySmall)
                        ],
                      )
                    ],
                  ),
                )
              ],
            )));
  }
}
