import "package:flutter/material.dart";
import "./categories_screen.dart";
import "./favourites_screen.dart";

class TabsScreeen extends StatefulWidget {
  const TabsScreeen({Key? key}) : super(key: key);

  @override
  State<TabsScreeen> createState() => _TabsScreeenState();
}

class _TabsScreeenState extends State<TabsScreeen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text("FoodApp"),
            bottom: TabBar(tabs: <Widget>[
              Tab(icon: Icon(Icons.category), text: "Categories"),
              Tab(icon: Icon(Icons.star), text: "Favourites"),
            ]),
          ),
          body: TabBarView(children: [CategoriesScreen(), favouritesScreen()])),
    );
  }
}
