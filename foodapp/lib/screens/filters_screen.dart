import "package:flutter/material.dart";
import "../widgets/main_drawer.dart";

class FilterScreen extends StatefulWidget {
  Function(Map<String, bool>) setFiltersFunction;
  final Map<String, bool> currentFilters;
  FilterScreen(this.setFiltersFunction, this.currentFilters);
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
  void initState() {
    _glutenFree = widget.currentFilters["gluten"] as bool;
    _lactosefree = widget.currentFilters["lactose"] as bool;
    _vegetarian = widget.currentFilters["vegetarian"] as bool;
    _vegan = widget.currentFilters["vegan"] as bool;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  "gluten": _glutenFree,
                  "lactose": _lactosefree,
                  "vegetarian": _vegetarian,
                  "vegan": _vegan
                };
                widget.setFiltersFunction(selectedFilters);
              })
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
                  activeColor: Theme.of(context).primaryColor,
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
                  activeColor: Theme.of(context).primaryColor,
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
                  activeColor: Theme.of(context).primaryColor,
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
                  activeColor: Theme.of(context).primaryColor,
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
