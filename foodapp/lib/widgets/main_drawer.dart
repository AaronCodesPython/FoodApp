import "package:flutter/material.dart";
import 'package:foodapp/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(String titleS, IconData icd, Function onTapFunction) {
    return ListTile(
      leading: Icon(
        icd,
        size: 26,
        color: Colors.black87,
      ),
      title: Text(titleS,
          style: const TextStyle(
              color: Colors.black87,
              fontFamily: "RobotoCondensed",
              fontSize: 24,
              fontWeight: FontWeight.bold)),
      onTap: () => onTapFunction(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).primaryColor,
      child: Column(
        children: [
          Container(
            color: Theme.of(context).colorScheme.secondary,
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.bottomLeft,
            child: const Text(
              "Cooking up!",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Colors.black87),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListTile("Meals", Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed("/");
          }),
          buildListTile("Filters", Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
          })
        ],
      ),
    );
  }
}
