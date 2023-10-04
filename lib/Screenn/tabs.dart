import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_meal_app/Screenn/categories.dart';
import 'package:new_meal_app/Screenn/filters.dart';
import 'package:new_meal_app/Screenn/main_drawer.dart';
import 'package:new_meal_app/Screenn/meals.dart';
import 'package:new_meal_app/data/dummy_data.dart';
import 'package:new_meal_app/provider/meals_provider.dart';
import 'package:new_meal_app/models/meal.dart';

const kInitialValue = {
  Filter.gluteenfree: false,
  Filter.lactosefrree: false,
  Filter.vegan: false,
  Filter.vegetarian: false,
};

class tabs extends ConsumerStatefulWidget {
  const tabs({super.key});

  @override
  ConsumerState<tabs> createState() => _tabsState();
}

class _tabsState extends ConsumerState<tabs> {
  int _selectPageIndex = 0;
  final List<Meal> _favouritemeal = [];
  Map<Filter, bool> _selectedFilter = kInitialValue;

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
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

  void _setscreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == "filters") {
      final result = await Navigator.of(context)
          .push<Map<Filter, bool>>(MaterialPageRoute(builder: (ctx) {
        return FiltersScreen(currentFilter: _selectedFilter);
      }));

      setState(() {
        _selectedFilter = result ?? kInitialValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    final availableMeals = meals.where((meal) {
      if (_selectedFilter[Filter.gluteenfree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilter[Filter.lactosefrree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilter[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilter[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    Widget activepage = CategoryScreen(
      ontoggleFavouurite: _toogleMealFavouriteStatus,
      availableMeals: availableMeals,
    );
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
      drawer: mainDrawer(onselectscren: _setscreen),
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
