import 'package:flutter/material.dart';

class Category {
  Category({
    this.color = Colors.purpleAccent , 
    required this.id, 
    required this.title});

  final String id;
  final String title;
  final Color color;
}
