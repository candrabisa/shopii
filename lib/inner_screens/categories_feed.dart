import 'package:aplikasi_shopii/providers/product_provider.dart';
import 'package:aplikasi_shopii/widget/feed_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';

class CategoriesFeedScreen extends StatelessWidget {
  CategoriesFeedScreen({Key? key}) : super(key: key);

  static const routeName = '/categories-feed-screen';

  @override
  Widget build(BuildContext context) {
    final categoryName = ModalRoute.of(context)!.settings.arguments as String;
    print(categoryName);

    final productProvider = Provider.of<ProductProvider>(context);
    List<ProductModel> productList =
        productProvider.findByCategory(categoryName);
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: SafeArea(
          child: StaggeredGridView.countBuilder(
            crossAxisCount: 6,
            itemCount: productList.length,
            itemBuilder: (BuildContext context, int index) => ChangeNotifierProvider.value(
              value: productList[index],
              child: const FeedProducts(),
              // id: productList[index].id,
              // description: productList[index].description,
              // price: productList[index].price,
              // imageUrl: productList[index].imageUrl,
              // quantity: productList[index].quantity,
              // isFavorite: productList[index].isFavorite,
            ),
            staggeredTileBuilder: (int index) =>
                StaggeredTile.count(3, index.isEven ? 4 : 4.2),
            mainAxisSpacing: 0.2,
            crossAxisSpacing: 0.1,
          ),
        ),
      ),
    );
  }
}
