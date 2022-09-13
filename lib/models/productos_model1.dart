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
  void _productosDb() {
    var list = <ProductosModel>[
      ProductosModel(
        name: 'Burger King',
        image: 'food1.png',
        price: 12,
      ),
      ProductosModel(
        name: 'Pizza Italiana',
        image: 'food2.png',
        price: 17,
      ),
      ProductosModel(
        name: 'Carne',
        image: 'food3.png',
        price: 25,
      ),
      ProductosModel(
        name: 'Asado',
        image: 'food4.png',
        price: 19,
      ),
      ProductosModel(
        name: 'Food Tailandesa',
        image: 'food5.png',
        price: 22,
      ),
      ProductosModel(
        name: 'Pizza',
        image: 'food6.png',
        price: 14,
      ),
      ProductosModel(
        name: 'Empanadas',
        image: 'food7.png',
        price: 15,
      ),
      ProductosModel(
        name: 'Postre',
        image: 'food8.png',
        price: 18,
      ),
      ProductosModel(
        name: 'Postre',
        image: 'food8.png',
        price: 18,
      ),
      ProductosModel(
        name: 'Postre',
        image: 'food8.png',
        price: 18,
      ),
      ProductosModel(
        name: 'Food Tailandesa',
        image: 'food5.png',
        price: 22,
      ),
      ProductosModel(
        name: 'Pizza',
        image: 'food6.png',
        price: 14,
      ),
    ];
    setState(() {
      _productosModel = list;
    });
  }*/