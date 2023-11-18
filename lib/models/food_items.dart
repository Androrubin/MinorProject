
import 'dart:convert';
import 'package:flutter/material.dart';

class FoodItem {
  final String image, name;
  final int id, price;
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
    price: 30,
    name: "Bread Omellete",
    itemCount: 1,
    isSelected: false,

  ),
  FoodItem(
    id: 2,
    image: "assets/images/omlette.png" ,
    price: 20,
    name: "Omellete",
    itemCount: 1,
    isSelected: false,

  ),
  FoodItem(
    id: 3,
    image: "assets/images/maggie.png" ,
    price: 20,
    name: "Maggie",
    itemCount: 1,
    isSelected: false,

  ),
  FoodItem(
    id: 4,
    image: "assets/images/pastery.png" ,
    price: 20,
    name: "Pastry",
    itemCount: 1,
    isSelected: false,

  ),
  FoodItem(
    id: 5,
    image: "assets/images/sandwich.png" ,
    price: 30,
    name: "Sandwich",
    itemCount: 1,
    isSelected: false,

  ),
  FoodItem(
      id: 6,
      image: "assets/images/hot_dog.png" ,
      price: 30,
      name: "Hot dog",
      itemCount: 1,
      isSelected: false,

      ),

];


// FoodItem foodItemsFromJson(String str) => FoodItem.fromJson(json.decode(str));
//
// String foodItemsToJson(FoodItem data) => json.encode(data.toJson());
//
// class FoodItem {//   final String id;
//   final String? image;
//   final int price;
//   final String name;
//   int itemCount;
//   bool isSelected;
//
//   FoodItem({
//     required this.id,
//      this.image,
//     required this.price,
//     required this.name,
//     required this.itemCount,
//     required this.isSelected,
//   });
//
//   factory FoodItem.fromJson(Map<String, dynamic> json) => FoodItem(
//     id: json["id"],
//     image: json["image"],
//     price: json["price"],
//     name: json["name"],
//     itemCount: json["itemCount"],
//     isSelected: json["isSelected"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "image": image,
//     "price": price,
//     "name": name,
//     "itemCount": itemCount,
//     "isSelected": isSelected,
//   };
// }

