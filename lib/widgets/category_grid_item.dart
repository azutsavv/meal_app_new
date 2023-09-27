import 'package:flutter/material.dart';
import 'package:new_meal_app/models/catergory.dart';

class CategoryGridItems extends StatelessWidget {
  const CategoryGridItems({
    super.key, 
    required this.category,
    required this.onselectedCategory
    });


  final Category category;
  final Function() onselectedCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onselectedCategory,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.5),
                category.color.withOpacity(0.9),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
        child: Text(
          category.title,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
