import 'package:flutter/material.dart';

class CartModel {
  late final String id;
  late final String title;
  late final String quantity;
  late final double price;
  late final String imageUrl;

  CartModel({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
    required this.imageUrl,
  });
}
