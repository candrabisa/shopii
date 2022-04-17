import 'package:flutter/cupertino.dart';

class ProductModel with ChangeNotifier {
  late final String id;
  late final String title;
  late final String description;
  late final double price;
  late final String imageUrl;
  late final String productCategoryName;
  late final String brand;
  late final int quantity;
  final bool? isFavorite;
  late final bool isPopular;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.productCategoryName,
    required this.brand,
    required this.quantity,
    this.isFavorite,
    required this.isPopular,
  });
}
