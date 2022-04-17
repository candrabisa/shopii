import 'package:aplikasi_shopii/inner_screens/product_detail.dart';
import 'package:aplikasi_shopii/models/product_model.dart';
import 'package:aplikasi_shopii/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrandsNavigationRail extends StatelessWidget {
  const BrandsNavigationRail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsAttributes = Provider.of<ProductModel>(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
            arguments: productsAttributes.id);
      },
      child: Container(
        // color: Colors.red,
        padding: const EdgeInsets.only(left: 5.0, right: 5.0),
        margin: const EdgeInsets.only(right: 20.0, bottom: 5.0, top: 18.0),
        constraints: const BoxConstraints(
            minHeight: 150, minWidth: double.infinity, maxHeight: 180),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  image: DecorationImage(
                    image: NetworkImage(productsAttributes.imageUrl),
                    fit: BoxFit.contain,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
              ),
            ),
            FittedBox(
              child: Container(
                margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(5.0, 5.0),
                        blurRadius: 10.0),
                  ],
                ),
                width: 160,
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productsAttributes.title,
                      maxLines: 4,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).textSelectionColor),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    FittedBox(
                      child: Text(
                        'US ${productsAttributes.price} \$',
                        maxLines: 1,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 30.0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      productsAttributes.productCategoryName,
                      style:
                          const TextStyle(color: Colors.grey, fontSize: 18.0),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
