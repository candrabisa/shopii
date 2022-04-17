import 'package:aplikasi_shopii/inner_screens/categories_feed.dart';
import 'package:aplikasi_shopii/screens/feed_screen.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  final List<Map<String, Object>> categories = [
    {
      'categoryName': 'Phones',
      'categoryImagesPath': 'assets/images/category_phone.png',
    },
    {
      'categoryName': 'Laptops',
      "categoryImagesPath": 'assets/images/category_laptop.jpg',
    },
    {
      'categoryName': 'Clothes',
      "categoryImagesPath": 'assets/images/category_cloth.png',
    },
    {
      'categoryName': 'Shoes',
      'categoryImagesPath': 'assets/images/category_sepatu.jpg',
    },
    {
      'categoryName': 'Furniture',
      'categoryImagesPath': 'assets/images/category_furniture.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              CategoriesFeedScreen.routeName,
              arguments: '${categories[widget.index]['categoryName']}',
            );
            print('${categories[widget.index]['categoryName']}');
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              image: DecorationImage(
                image: AssetImage(
                    categories[widget.index]['categoryImagesPath'].toString()),
                fit: BoxFit.cover,
              ),
            ),
            margin: const EdgeInsets.only(right: 8, top: 14, left: 8),
            height: 150,
            width: 150,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 8,
          right: 8,
          child: Container(
            // margin: const EdgeInsets.symmetric(horizontal: 5),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            color: Theme.of(context).backgroundColor,
            child: Text(
              categories[widget.index]['categoryName'].toString(),
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
                color: Theme.of(context).textSelectionColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}
