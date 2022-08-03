import "package:flutter/material.dart";
import "./categories_screen.dart";
import "./favourites_screen.dart";

class TabsScreeen extends StatefulWidget {
  const TabsScreeen({Key? key}) : super(key: key);
  @override
  State<TabsScreeen> createState() => _TabsScreeenState();
}

class _TabsScreeenState extends State<TabsScreeen> {
  final List<Widget> pages = [CategoriesScreen(), favouritesScreen()];
  int _selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FoodApp"),
      ),
      body: pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        unselectedItemColor: Colors.black54,
        selectedItemColor: Colors.black87,
        onTap: (int index) {
          setState(() {
            _selectedPageIndex = index;
          });
        },
        backgroundColor: Theme.of(context).primaryColor,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
