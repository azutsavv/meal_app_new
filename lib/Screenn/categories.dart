import 'package:flutter/material.dart';
import 'package:new_meal_app/Screenn/meals.dart';
import 'package:new_meal_app/data/dummy_data.dart';
import 'package:new_meal_app/models/catergory.dart';
import 'package:new_meal_app/widgets/category_grid_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  void _selectedCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => Meals(
        title: category.title,
        meal: filteredMeals),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("meal app"),
      ),
      body: GridView(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItems(
                category: category,
                onselectedCategory: () {
                  _selectedCategory(context,category);
                })
        ],
      ),
    );
  }
}
