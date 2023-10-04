import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_meal_app/provider/meals_provider.dart';

enum Filter {
  gluteenfree,
  lactosefrree,
  vegetarian,
  vegan,
}

class filterNotifier extends StateNotifier<Map<Filter, bool>> {
  filterNotifier()
      : super({
          Filter.gluteenfree: false,
          Filter.lactosefrree: false,
          Filter.vegetarian: false,
          Filter.vegan: false,
        });

  void setfilters(Map<Filter, bool> chosenFilter) {
    state = chosenFilter;
  }

  void setfilter(Filter filter, bool isActive) {
    //state[filter] = isActive; // not allowed !=> mutating state;
    state = {...state, filter: isActive};
  }
}

final filterProvider = StateNotifierProvider<filterNotifier, Map<Filter, bool>>(
    (ref) => filterNotifier());

final filteredMealProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filterProvider);
  return meals.where((meal) {
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
});
