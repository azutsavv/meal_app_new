import 'package:flutter/material.dart';
import 'package:new_meal_app/models/meal.dart';

class Meals extends StatelessWidget {
  const Meals({super.key, required this.title, required this.meal});

  final String title;
  final List<Meal> meal;

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
              return Text(meal[index].title,);
            }),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Container(
          alignment: Alignment.center,
          child: content,
        ));
  }
}