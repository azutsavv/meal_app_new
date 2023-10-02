import 'package:flutter/material.dart';
import 'package:new_meal_app/Screenn/categories.dart';
import 'package:new_meal_app/Screenn/meals.dart';
import 'package:new_meal_app/models/meal.dart';

class tabs extends StatefulWidget {
  const tabs({super.key});

  @override
  State<tabs> createState() => _tabsState();
}

class _tabsState extends State<tabs> {
  int _selectPageIndex = 0;
  final List<Meal> _favouritemeal = [];

  void _toogleMealFavouriteStatus(Meal meal) {
    final isExisting = _favouritemeal.contains(meal);

    if (isExisting) {
      _favouritemeal.remove(meal);
    } else {
      _favouritemeal.add(meal);
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activepage = CategoryScreen(ontoggleFavouurite: _toogleMealFavouriteStatus );
    var activepagetitle = 'Categories';
    if (_selectPageIndex == 1) {
      activepage =  Meals(meal: [], ontoggleFavouurite: _toogleMealFavouriteStatus,);
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
