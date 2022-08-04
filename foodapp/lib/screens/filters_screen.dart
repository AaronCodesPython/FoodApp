import "package:flutter/material.dart";
import "../widgets/main_drawer.dart";

class FilterScreen extends StatefulWidget {
  Function setFiltersFunction;
  FilterScreen(this.setFiltersFunction);
  static const String routeName = "/filters";

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactosefree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {}, //TODO
          )
        ],
      ),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: Text("Adjust your meal selection",
              style: Theme.of(context).textTheme.titleMedium),
        ),
        Expanded(
          child: ListView(
            children: [
              SwitchListTile(
                  title: Text("Lactose-Free"),
                  subtitle: Text("Only include Lactose-Free meals...",
                      style: Theme.of(context).textTheme.bodyMedium),
                  value: _lactosefree,
                  onChanged: (bool nv) {
                    setState(() {
                      _lactosefree = nv;
                    });
                  }),
              SwitchListTile(
                  title: Text("Gluten-Free"),
                  subtitle: Text("Only include Gluten-Free meals...",
                      style: Theme.of(context).textTheme.bodyMedium),
                  value: _glutenFree,
                  onChanged: (bool nv) {
                    setState(() {
                      _glutenFree = nv;
                    });
                  }),
              SwitchListTile(
                  title: Text("Vegetarian"),
                  subtitle: Text("Only include Vegetarian meals...",
                      style: Theme.of(context).textTheme.bodyMedium),
                  value: _vegetarian,
                  onChanged: (bool nv) {
                    setState(() {
                      _vegetarian = nv;
                    });
                  }),
              SwitchListTile(
                  title: Text("Vegan"),
                  subtitle: Text("Only include Vegan meals...",
                      style: Theme.of(context).textTheme.bodyMedium),
                  value: _vegan,
                  onChanged: (bool nv) {
                    setState(() {
                      _vegan = nv;
                    });
                  }),
            ],
          ),
        ),
      ]),
      drawer: const MainDrawer(),
    );
  }
}
