import "package:flutter/material.dart";
import "../widgets/main_drawer.dart";

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key}) : super(key: key);
  static const String routeName = "/filters";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      body: const Center(
        child: Text("Filters!"),
      ),
      drawer: const MainDrawer(),
    );
  }
}
