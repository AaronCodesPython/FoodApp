import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import "package:flutter/material.dart";
import '../screens/category_info_screen.dart';

class categoryItem extends StatelessWidget {
  final title;
  final bgColor;
  final Id;

  final BorderRadius br = BorderRadius.circular(15);

  categoryItem({required this.title, required this.bgColor, required this.Id});

  void SelectCategory(BuildContext ctx) {
    //pushes new page on Page-Stack
    Navigator.of(ctx).pushNamed(category_info.routeName,
        arguments: {"Id": Id, "title": title, "bgColor": bgColor});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => SelectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: br,
      child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [bgColor.withOpacity(0.5), bgColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
              borderRadius: br),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          )),
    );
  }
}