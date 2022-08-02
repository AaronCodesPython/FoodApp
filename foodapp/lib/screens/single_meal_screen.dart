import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import "package:flutter/material.dart";
import "../widgets/dummy_data.dart";

class SingleMealScreen extends StatelessWidget {
  const SingleMealScreen({Key? key}) : super(key: key);
  static const route_name = "/single-meal";
  Widget build_SectionTitle(BuildContext context, String titleText) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child:
          Text("$titleText:", style: Theme.of(context).textTheme.titleMedium),
    );
  }

  Widget build_Container(Widget childW) {
    return Container(
      child: childW,
      decoration: BoxDecoration(
          color: Colors.black26,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(20)),
      height: 200,
      width: 350,
    );
  }

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
            selectedMeal.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  height: 300,
                  width: double.infinity,
                  child: Image.network(selectedMeal.imageUrl)),
              build_SectionTitle(context, "Ingredients"),
              build_Container(ListView.builder(
                  itemCount: selectedMeal.ingredients.length,
                  itemBuilder: (ctx, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Card(
                        color: backgroundColor,
                        child: Container(
                            padding: EdgeInsets.all(10),
                            child: Center(
                                child: Text(selectedMeal.ingredients[index]))),
                      ),
                    );
                  })),
              build_SectionTitle(context, "Steps"),
              build_Container(ListView.builder(
                  itemCount: selectedMeal.steps.length,
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        ListTile(
                            leading: CircleAvatar(
                                backgroundColor: backgroundColor,
                                child: Text("${index + 1}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium)),
                            title: Text(selectedMeal.steps[index],
                                style: Theme.of(context).textTheme.bodyMedium)),
                        Divider(
                          color: Colors.white60,
                          height:
                              3, // TODO remove later to scale for different sizes
                          thickness: 1,
                        )
                      ],
                    );
                  }))
            ],
          ),
        ));
  }
}
