import 'package:aplikasi_shopii/consts/colors.dart';
import 'package:aplikasi_shopii/consts/my_icons.dart';
import 'package:aplikasi_shopii/inner_screens/product_detail.dart';
import 'package:aplikasi_shopii/models/product_model.dart';
import 'package:aplikasi_shopii/providers/product_provider.dart';

import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:provider/provider.dart';

class PopularProduct extends StatelessWidget {
  // final String imageUrl;
  // final String title;
  // final String description;
  // final double price;

  // const PopularProduct(
  //     {Key? key,
  //     required this.imageUrl,
  //     required this.title,
  //     required this.description,
  //     required this.price})
  //     : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsAttributes = Provider.of<ProductModel>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 250,
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
        ),
        child: InkWell(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
          onTap: () => Navigator.of(context).pushNamed(
            ProductDetailScreen.routeName,
            arguments: productsAttributes.id,
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 170,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(productsAttributes.imageUrl),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 12,
                    top: 10,
                    child: Icon(
                      MyIcons.wishlist,
                      color: MyColors.favColor,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 7,
                    child: Icon(
                      MyIcons.starOff,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    right: 12,
                    bottom: 32,
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      color: Theme.of(context).backgroundColor,
                      child: Text('\$ ${productsAttributes.price}',
                          style: TextStyle(
                              color: Theme.of(context).textSelectionColor)),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productsAttributes.title,
                      maxLines: 1,
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text(
                            productsAttributes.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[500],
                            ),
                          ),
                        ),
                        const Spacer(),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(30.0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                MyIcons.cartPlus,
                                size: 25,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
