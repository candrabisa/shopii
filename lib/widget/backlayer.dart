import 'package:aplikasi_shopii/consts/colors.dart';
import 'package:aplikasi_shopii/consts/my_icons.dart';
import 'package:aplikasi_shopii/screens/feed_screen.dart';
import 'package:aplikasi_shopii/widget/feed_products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BackLayerMenu extends StatelessWidget {
   BackLayerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                MyColors.starterColor,
                MyColors.endColor,
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: const [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        Positioned(
          top: -100.0,
          left: 140.0,
          child: Transform.rotate(
            angle: -0.5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white.withOpacity(0.3),
              ),
              width: 150,
              height: 250,
            ),
          ),
        ),
        Positioned(
          bottom: 10.0,
          right: 0.0,
          child: Transform.rotate(
            angle: -0.8,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white.withOpacity(0.3),
              ),
              width: 150,
              height: 200,
            ),
          ),
        ),
        SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        image: const DecorationImage(
                          image: NetworkImage(
                              'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                content(context, () {
                  navigateTo(context, FeedScreen.routeName);
                }, 'FeedScreen', 0),
                const SizedBox(
                  height: 10.0,
                ),
                content(context, () {
                  navigateTo(context, '/cart-screen');
                }, 'Cart', 1),
                const SizedBox(
                  height: 10.0,
                ),
                content(context, () {
                  navigateTo(context, '/wishlist-screen');
                }, 'Wishlist', 2),
                const SizedBox(
                  height: 10.0,
                ),
                content(context, () {
                  navigateTo(context, '/upload-product-from-screen');
                }, 'Upload Product From', 3),
              ],
            ),
          ),
        ),
      ],
    );
  }

  List _contentIcons = [
    MyIcons.rss,
    MyIcons.bag,
    MyIcons.wishlist,
    MyIcons.upload
  ];

  void navigateTo(BuildContext ctx, String routeName) {
    Navigator.of(ctx).pushNamed(routeName);
  }

  Widget content(
      BuildContext context, VoidCallback callback, String text, int index) {
    return InkWell(
      onTap: callback,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
          ),
          Icon(_contentIcons[index]),
        ],
      ),
    );
  }
}
