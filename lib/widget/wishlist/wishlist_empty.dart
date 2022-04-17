import 'package:aplikasi_shopii/consts/colors.dart';
import 'package:aplikasi_shopii/consts/theme_manager.dart';
import 'package:aplikasi_shopii/providers/theme_provider.dart';
import 'package:aplikasi_shopii/screens/feed_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishlistEmpty extends StatelessWidget {
  const WishlistEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeDarkProvider = Provider.of<ThemeDarkProvider>(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 60),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage(
                  'assets/images/empty-wishlist.png',
                ),
              ),
            ),
          ),
          const Text(
            'Your Wishlist Is Empty',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              // color: Theme.of(context).textSelectionColor,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            'Explore more and shorlist some items',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.normal,
              color: themeDarkProvider.darkTheme
                  ? Theme.of(context).disabledColor
                  : MyColors.subTitle,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30.0),
            height: MediaQuery.of(context).size.height * 0.055,
            width: MediaQuery.of(context).size.width * 0.9,
            child: RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(FeedScreen.routeName);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(
                  color: Colors.red,
                ),
              ),
              color: Colors.redAccent,
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'Add a wish'.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).textSelectionColor,
                    // color: Theme.of(context).textSelectionColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
