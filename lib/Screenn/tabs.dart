import 'package:flutter/material.dart';
import 'package:new_meal_app/Screenn/categories.dart';
import 'package:new_meal_app/Screenn/main_drawer.dart';
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

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(
          elevation: 5,
          duration: const Duration(seconds: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        content: Text(message)));
  }

  void _toogleMealFavouriteStatus(Meal meal) {
    final isExisting = _favouritemeal.contains(meal);

    if (isExisting) {
      setState(() {
        _favouritemeal.remove(meal);
      });
      _showInfoMessage("Removed from favourite list");
    } else {
      setState(() {
        _favouritemeal.add(meal);
        _showInfoMessage("Added to favourite List");
      });
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activepage =
        CategoryScreen(ontoggleFavouurite: _toogleMealFavouriteStatus);
    var activepagetitle = 'Categories';
    if (_selectPageIndex == 1) {
      activepage = Meals(
        meal: _favouritemeal,
        ontoggleFavouurite: _toogleMealFavouriteStatus,
      );
      activepagetitle = 'Favourite';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activepagetitle),
      ),
      drawer:const  mainDrawer(),
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
