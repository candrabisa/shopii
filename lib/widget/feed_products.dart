import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import 'package:aplikasi_shopii/consts/my_icons.dart';
import 'package:aplikasi_shopii/inner_screens/product_detail.dart';
import 'package:aplikasi_shopii/models/product_model.dart';
import 'package:provider/provider.dart';

import '../providers/product_provider.dart';

class FeedProducts extends StatefulWidget {
  const FeedProducts({
    Key? key,
    // required this.id,
    // required this.description,
    // required this.price,
    // required this.imageUrl,
    // required this.quantity,
    // this.isFavorite,
  }) : super(key: key);

  // final String id;
  // final String description;
  // final double price;
  // final String imageUrl;
  // final int quantity;
  // final bool? isFavorite;

  @override
  _FeedProductsState createState() => _FeedProductsState();
}

class _FeedProductsState extends State<FeedProducts> {
  @override
  Widget build(BuildContext context) {
    final productAttr = Provider.of<ProductModel>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
              arguments: productAttr.id);
        },
        child: Container(
          width: 250,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Theme.of(context).backgroundColor,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(2),
                    child: Container(
                      width: double.infinity,
                      constraints: const BoxConstraints(
                        minHeight: 100,
                        maxHeight: 120,
                        // maxHeight: MediaQuery.of(context).size.height * 0.3,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Image.network(
                          productAttr.imageUrl,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Badge(
                      alignment: Alignment.topRight,
                      toAnimate: true,
                      shape: BadgeShape.square,
                      badgeColor: Colors.deepPurple,
                      animationType: BadgeAnimationType.scale,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                      ),
                      badgeContent: const Text('New',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(left: 5),
                margin: const EdgeInsets.only(left: 5, bottom: 2, right: 3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      productAttr.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Text(
                        '\$ ${productAttr.price}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${productAttr.quantity}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(18.0),
                            child: Icon(
                              MyIcons.more,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
