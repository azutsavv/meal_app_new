import 'package:flutter/material.dart';
import 'package:new_meal_app/models/meal.dart';

class mealDetailScreen extends StatelessWidget {
  const mealDetailScreen({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(meal.imageUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
      
            const SizedBox(height: 14,),
      
            Text('Ingredients',
             style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),),
            
            const SizedBox(height: 14,),
      
            for(final ingredients in meal.ingredients)
              Text(ingredients,
                style:Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white
                ),),
      
            const SizedBox(height: 14,),
      
            Text('Steps',
             style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),),
            
            const SizedBox(height: 14,),
      
            for(final steps in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10 , horizontal: 20),
                child: Text(steps,
                  textAlign: TextAlign.center,
                  style:Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white
                  ),),
              ),
      
      
      
          ],
        ),
      )
    );
  }
}
