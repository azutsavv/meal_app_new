import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  void setfilter(Filter filter, bool isActive) {
    //state[filter] = isActive; // not allowed !=> mutating state;
    state = {...state, filter: isActive};
  }
}

final filterProvider = StateNotifierProvider<filterNotifier, Map<Filter, bool>>(
    (ref) => filterNotifier());
