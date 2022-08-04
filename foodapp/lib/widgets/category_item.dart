// ignore: file_names
import "package:flutter/material.dart";
import '../screens/category_info_screen.dart';

class CategoryItem extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final title;
  // ignore: prefer_typing_uninitialized_variables
  final bgColor;
  // ignore: prefer_typing_uninitialized_variables
  final id;

  final BorderRadius br = BorderRadius.circular(15);

  CategoryItem(
      {Key? key, required this.title, required this.bgColor, required this.id})
      : super(key: key);
  void selectCategory(BuildContext ctx) {
    //pushes new page on Page-Stack
    Navigator.of(ctx).pushNamed(CategoryInfo.routeName,
        arguments: {"Id": id, "title": title, "bgColor": bgColor});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
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
