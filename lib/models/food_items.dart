import 'package:flutter/material.dart';

class FoodItem {
  final String image, name,price;
  final int id;
  int  itemCount;
  bool isSelected;

  FoodItem({
    required this.id,
    required this.image,
    required this.price,
    required this.name,
    required this.itemCount,
    required this.isSelected,
   // required this.add_icon,
   // required this.icon,
});
}

List<FoodItem> food_item = [
  FoodItem(
    id: 1,
    image: "assets/images/bread_omellete.png" ,
    price: "₹30",
    name: "Bread Omellete",
    itemCount: 1,
    isSelected: false,

  ),
  FoodItem(
    id: 2,
    image: "assets/images/omlette.png" ,
    price: "₹20",
    name: "Omellete",
    itemCount: 1,
    isSelected: false,

  ),
  FoodItem(
    id: 3,
    image: "assets/images/maggie.png" ,
    price: "₹20",
    name: "Maggie",
    itemCount: 1,
    isSelected: false,

  ),
  FoodItem(
    id: 4,
    image: "assets/images/pastery.png" ,
    price: "₹20",
    name: "Pastry",
    itemCount: 1,
    isSelected: false,

  ),
  FoodItem(
    id: 5,
    image: "assets/images/sandwich.png" ,
    price: "₹30",
    name: "Sandwich",
    itemCount: 1,
    isSelected: false,

  ),
  FoodItem(
    id: 6,
    image: "assets/images/hot_dog.png" ,
    price: "₹20",
    name: "Hot dog",
    itemCount: 1,
    isSelected: false,

  ),

];