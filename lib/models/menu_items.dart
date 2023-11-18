import 'package:flutter/material.dart';




class MenuItem {
  final String title;
  final String description;
  final String imagePath;

  MenuItem({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}

final List<MenuItem> menuItems = [
  MenuItem(
      title: "Breakfast",
      description: "Dosa, bread-butter",
      imagePath: "assets/images/breakfast.png"),
  MenuItem(
      title: "Lunch",
      description: "Rice, curry, vegetables",
      imagePath: "assets/images/lunch.png"),
  MenuItem(
      title: "Snacks",
      description: "Sandwich, coffee",
      imagePath: "assets/images/snacks.png"),
  MenuItem(
      title: "Dinner",
      description: "Pasta, salad",
      imagePath: "assets/images/dinner.png"),

];