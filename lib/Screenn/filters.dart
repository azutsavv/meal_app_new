import 'package:flutter/material.dart';
import 'package:new_meal_app/widgets/filters_widget.dart';
import 'package:new_meal_app/provider/filter_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:new_meal_app/Screenn/main_drawer.dart';
// import 'package:new_meal_app/Screenn/tabs.dart';
// import 'package:new_meal_app/main.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yours Filters"),
      ),
      body: Column(
        children: [
          filtertype(
            type: activeFilters[Filter.gluteenfree]!,
            onChanged: (newValue) {
              ref
                  .read(filterProvider.notifier)
                  .setfilter(Filter.gluteenfree, newValue);
            },
            title: "Gluteen-Free",
            subtitle: "food is gluteen free",
          ),
          filtertype(
              type: activeFilters[Filter.lactosefrree]!,
              onChanged: (newValue) {
                ref
                    .read(filterProvider.notifier)
                    .setfilter(Filter.lactosefrree, newValue);
              },
              title: "Lactose-Free",
              subtitle: "food is lactose free"),
          filtertype(
              type: activeFilters[Filter.vegetarian]!,
              onChanged: (newValue) {
                ref
                    .read(filterProvider.notifier)
                    .setfilter(Filter.vegetarian, newValue);
              },
              title: "Vegetarian",
              subtitle: "food is vegetarian"),
          filtertype(
              type: activeFilters[Filter.vegan]!,
              onChanged: (newValue) {
                ref
                    .read(filterProvider.notifier)
                    .setfilter(Filter.vegan, newValue);
              },
              title: "vegan",
              subtitle: "food is vegan"),
        ],
      ),
    );
  }
}
