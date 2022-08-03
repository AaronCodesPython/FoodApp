import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import "package:flutter/material.dart";

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);
  Widget buildListTile(String titleS, IconData icd) {
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
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).primaryColor,
      child: Column(
        children: [
          Container(
            color: Theme.of(context).accentColor,
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.bottomLeft,
            child: Text(
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
          buildListTile("Meals", Icons.restaurant),
          buildListTile("Filters", Icons.settings)
        ],
      ),
    );
  }
}
