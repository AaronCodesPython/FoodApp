import "package:flutter/material.dart";
import "../widgets/main_drawer.dart";

class filterScreen extends StatelessWidget {
  const filterScreen({Key? key}) : super(key: key);
  static const String RouteName = "/filters";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
      ),
      body: Center(
        child: Text("Filters!"),
      ),
      drawer: MainDrawer(),
    );
  }
}
