import 'package:aplikasi_shopii/consts/colors.dart';
import 'package:aplikasi_shopii/consts/my_icons.dart';
import 'package:aplikasi_shopii/providers/product_provider.dart';
import 'package:aplikasi_shopii/providers/theme_provider.dart';
import 'package:aplikasi_shopii/screens/cart_screen.dart';
import 'package:aplikasi_shopii/screens/wishlist_screen.dart';
import 'package:aplikasi_shopii/widget/feed_products.dart';
import 'package:aplikasi_shopii/widget/popular_products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  static const routeName = '/product-detail-screen';

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<ThemeDarkProvider>(context);
    final productsData = Provider.of<ProductProvider>(context);
    final popularItems = productsData.popularProducts;
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    print('productId $productId');
    final productAttr = productsData.findbyId(productId);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(
          color: themeState.darkTheme ? Colors.white : Colors.black,
        ),
        title: Text(
          'Detail',
          style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              color: themeState.darkTheme ? Colors.white : Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, WishlistScreen.routeName);
            },
            icon: Icon(
              MyIcons.wishlist,
              color: MyColors.favColor,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, CartScreen.routeName);
            },
            icon: Icon(
              MyIcons.cart,
              color: MyColors.cartColor,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            foregroundDecoration: BoxDecoration(color: Colors.black12),
            height: MediaQuery.of(context).size.height * 0.45,
            width: double.infinity,
            child: Image.network(
              productAttr.imageUrl,
              fit: BoxFit.contain,
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 250,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.purple.shade200,
                          onTap: () {},
                          borderRadius: BorderRadius.circular(30),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.save,
                              size: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.purple.shade200,
                          onTap: () {},
                          borderRadius: BorderRadius.circular(30),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.share,
                              size: 23,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: Text(
                                productAttr.title,
                                maxLines: 2,
                                style: TextStyle(
                                  color: Theme.of(context).textSelectionColor,
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              'US \$ ${productAttr.price}',
                              style: TextStyle(
                                color: themeState.darkTheme
                                    ? Theme.of(context).disabledColor
                                    : MyColors.subTitle,
                                fontWeight: FontWeight.bold,
                                fontSize: 21.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 3.0,
                      ),
                      const Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey,
                          height: 1,
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          productAttr.description,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 21.0,
                            color: themeState.darkTheme
                                ? Theme.of(context).disabledColor
                                : MyColors.subTitle,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      const Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey,
                          height: 1,
                        ),
                      ),
                      _details(
                          themeState.darkTheme, 'Brand: ', productAttr.brand),
                      _details(themeState.darkTheme, 'Quantity: ',
                          '${productAttr.quantity}'),
                      _details(themeState.darkTheme, 'Category: ',
                          productAttr.productCategoryName),
                      _details(themeState.darkTheme, 'Popularity: ',
                          productAttr.isPopular ? 'Popular' : 'Barely known'),
                      const SizedBox(
                        height: 15,
                      ),
                      const Divider(
                        thickness: 1,
                        color: Colors.grey,
                        height: 1,
                      ),
                      Container(
                        color: Theme.of(context).backgroundColor,
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 10.0),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'No reviews yet',
                                style: TextStyle(
                                    color: Theme.of(context).textSelectionColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 21.0),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                'Be the first review!',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: themeState.darkTheme
                                      ? Theme.of(context).disabledColor
                                      : MyColors.subTitle,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 70,
                            ),
                            const Divider(
                              thickness: 1,
                              color: Colors.grey,
                              height: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8.0),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: const Text(
                    'Suggested products',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  width: double.infinity,
                  height: 300,
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext ctx, int index) =>
                        ChangeNotifierProvider.value(
                      value: popularItems[index],
                      child: PopularProduct(),
                      // description: popularItems[index].description,
                      // price: popularItems[index].price,
                      // title: popularItems[index].title,
                      // imageUrl: popularItems[index].imageUrl,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    height: 50,
                    child: RaisedButton(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape:
                          const RoundedRectangleBorder(side: BorderSide.none),
                      color: Colors.redAccent.shade400,
                      onPressed: () {},
                      child: Text(
                        'Add to cart'.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 50,
                    child: RaisedButton(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape:
                          const RoundedRectangleBorder(side: BorderSide.none),
                      color: Theme.of(context).backgroundColor,
                      onPressed: () {},
                      child: Row(
                        children: [
                          Text(
                            'Buy now'.toUpperCase(),
                            style: TextStyle(
                              color: Theme.of(context).textSelectionColor,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.payment,
                            color: Colors.green.shade700,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: themeState.darkTheme
                        ? Theme.of(context).disabledColor
                        : Colors.blueGrey,
                    height: 50,
                    child: InkWell(
                      splashColor: MyColors.favColor,
                      onTap: () {},
                      child: Center(
                        child: Icon(
                          MyIcons.wishlist,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _details(bool themeState, String title, String info) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Theme.of(context).textSelectionColor,
              fontWeight: FontWeight.w600,
              fontSize: 21.0,
            ),
          ),
          Text(
            info,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20.0,
              color: themeState
                  ? Theme.of(context).disabledColor
                  : MyColors.subTitle,
            ),
          ),
        ],
      ),
    );
  }
}
