import 'package:aplikasi_shopii/consts/colors.dart';
import 'package:aplikasi_shopii/consts/theme_manager.dart';
import 'package:aplikasi_shopii/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartEmpty extends StatelessWidget {
  const CartEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeDarkProvider = Provider.of<ThemeDarkProvider>(context);

    return Column(
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
                'assets/images/emptycart.png',
              ),
            ),
          ),
        ),
        const Text(
          'Your Cart Is Empty',
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
          'Looks like you didn\'t \n add anything to your cart yet',
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
          // width: MediaQuery.of(context).size.width * 0.7,
          child: RaisedButton(
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(
                color: Colors.red,
              ),
            ),
            color: Theme.of(context).textSelectionColor,
            child: const SizedBox(
              width: double.infinity,
              child: Text(
                'Shop Now',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  // color: Theme.of(context).textSelectionColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
