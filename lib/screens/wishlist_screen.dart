import 'package:aplikasi_shopii/consts/my_icons.dart';
import 'package:aplikasi_shopii/widget/wishlist/wishlist_empty.dart';
import 'package:aplikasi_shopii/widget/wishlist/wishlist_full.dart';
import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  static const routeName = '/wishlist-screen';

  @override
  Widget build(BuildContext context) {
    List? product = [];
    return product.isNotEmpty
        ? const Scaffold(
            body: SafeArea(child: WishlistEmpty()),
          )
        : Scaffold(
            appBar: AppBar(
              title: const Text('Wishlist'),
            ),
            body: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext ctx, int index) {
                  return const WishlistFul();
                }),
          );
  }
}
