import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import "package:flutter/material.dart";
import '../models/meal.dart';
import "../screens/single_meal_screen.dart";

class mealItem extends StatelessWidget {
  final String title;
  final String id;
  final String imageURL;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Color backgroundColor;

  mealItem(
      {required this.title,
      required this.id,
      required this.imageURL,
      required this.duration,
      required this.complexity,
      required this.affordability,
      required this.backgroundColor});

  String get complexityText {
    switch (complexity) {
      case Complexity.Beginner:
        return "Beginner";
        break;
      case Complexity.Intermediate:
        return "Intermediate";
        break;
      case Complexity.Expert:
        return "Expert";
        break;
      case Complexity.Chefcook:
        return "Chefcook";
        break;
      default:
        return "Error";
    }
  }

  String get AffordabilityText {
    switch (affordability) {
      case Affordability.reallyaffordable:
        return "\$";
        break;
      case Affordability.affordable:
        return "\$\$";
        break;
      case Affordability.medium:
        return "\$\$\$";
        break;
      case Affordability.pricey:
        return "\$\$\$\$";
        break;
      case Affordability.reallypricey:
        return "\$\$\$\$\$";
        break;
      default:
        return "Error! :O";
    }
  }

  void selectMeal(BuildContext context) {
    Map<String, dynamic> args = {"id": id, "backgroundColor": backgroundColor};

    Navigator.of(context)
        .pushNamed(SingleMealScreen.route_name, arguments: args);
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
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        color: Colors.black54,
                        width: 300,
                        child: Text(
                          title,
                          style: TextStyle(fontSize: 26, color: Colors.white),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.access_time_filled),
                          SizedBox(width: 6),
                          Text("$duration min",
                              style: Theme.of(context).textTheme.bodySmall)
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.work),
                          SizedBox(width: 6),
                          Text(complexityText,
                              style: Theme.of(context).textTheme.bodySmall)
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.account_balance_wallet),
                          SizedBox(width: 6),
                          Text(AffordabilityText,
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
