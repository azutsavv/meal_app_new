import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_meal_app/Screenn/categories.dart';
import 'package:new_meal_app/Screenn/filters.dart';
import 'package:new_meal_app/Screenn/main_drawer.dart';
import 'package:new_meal_app/Screenn/meals.dart';
import 'package:new_meal_app/provider/favourite_provider.dart';
import 'package:new_meal_app/provider/meals_provider.dart';
import 'package:new_meal_app/provider/filter_provider.dart';

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

  void _selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  void _setscreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == "filters") {
      await Navigator.of(context)
          .push<Map<Filter, bool>>(MaterialPageRoute(builder: (ctx) {
        return const FiltersScreen();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    final activeFilters = ref.watch(filterProvider);
    final availableMeals = meals.where((meal) {
      if (activeFilters[Filter.gluteenfree]! && !meal.isGlutenFree) {
        return false;
      }
      if (activeFilters[Filter.lactosefrree]! && !meal.isLactoseFree) {
        return false;
      }
      if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (activeFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    Widget activepage = CategoryScreen(
      availableMeals: availableMeals,
    );
    var activepagetitle = 'Categories';
    if (_selectPageIndex == 1) {
      final favouriteMeals = ref.watch(favouriteMealsProvider);
      activepage = Meals(
        meal: favouriteMeals,
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
