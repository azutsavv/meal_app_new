import 'package:flutter/material.dart';
import 'package:new_meal_app/Screenn/categories.dart';
import 'package:new_meal_app/Screenn/meals.dart';

class tabs extends StatefulWidget {
  const tabs({super.key});

  @override
  State<tabs> createState() => _tabsState();
}

class _tabsState extends State<tabs> {
  int _selectPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activepage = CategoryScreen();
    var activepagetitle = 'Categories';
    if (_selectPageIndex == 1) {
      activepage = const Meals( meal: []);
      activepagetitle = 'Favourite';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activepagetitle),
      ),
      body: activepage,
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          currentIndex: _selectPageIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal), label: 'Categories'),
            BottomNavigationBarItem(
                icon: Icon(Icons.star), label: 'Favourites'),
          ]),
    );
  }
}
