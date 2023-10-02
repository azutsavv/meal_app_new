import 'package:flutter/material.dart';
import 'package:new_meal_app/Screenn/meal_detail_screen.dart';
import 'package:new_meal_app/models/meal.dart';
import 'package:new_meal_app/widgets/meal_item.dart';

class Meals extends StatelessWidget {
  const Meals(
      {super.key,
      this.title,
      required this.meal,
      required this.ontoggleFavouurite});

  final String? title;
  final List<Meal> meal;
  final void Function(Meal meal) ontoggleFavouurite;

  void selectmeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => mealDetailScreen(
            meal: meal, ontoggleFavouurite: ontoggleFavouurite)));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Nothing Selected Till Now",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "try selecting a different category",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ],
      ),
    );

    if (meal.isNotEmpty) {
      content = Container(
        alignment: Alignment.center,
        child: ListView.builder(
            itemCount: meal.length,
            itemBuilder: (ctx, index) {
              return MealItem(
                meal: meal[index],
                onselectMeal: (meal) {
                  selectmeal(context, meal);
                },
              );
            }),
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: Container(
          alignment: Alignment.center,
          child: content,
        ));
  }
}
