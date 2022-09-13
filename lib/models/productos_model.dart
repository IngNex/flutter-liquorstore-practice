import 'package:flutter/material.dart';

class ProductosModel {
  final String name;
  final String image;
  /*final Color color;*/
  final int price;
  int quantity = 1;

  ProductosModel(
      {required this.name,
      required this.image,
      /*required this.color,*/
      required this.price,
      this.quantity = 1});
}


/*
class ProductosModel {
  final int id;
  final String name;
  final String image;
  final int price;
  int quantity = 0;

  ProductosModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
  });

  factory ProductosModel.fromMap(Map<String, dynamic> json) => ProductosModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        price: json["price"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "image": image,
        "price": price,
        "quantity": quantity,
      };
*/