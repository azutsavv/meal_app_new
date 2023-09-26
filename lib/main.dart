import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:new_meal_app/Screenn/categories.dart';
import 'package:new_meal_app/Screenn/meals.dart';
import 'package:new_meal_app/data/dummy_data.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home:  Meals(title: 'some category', meal:dummyMeals ),
    );
  }
}