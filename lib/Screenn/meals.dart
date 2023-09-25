import 'package:flutter/material.dart';
import 'package:new_meal_app/models/meal.dart';

class meals extends StatelessWidget {
  const meals({super.key, required this.title, required this.meal});

  final String title;
  final List<Meal> meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(itemBuilder: (ctx, index) {
        Text(meal[index].title);
      }),
    );
  }
}
