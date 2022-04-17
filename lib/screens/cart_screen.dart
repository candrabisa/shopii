import 'package:aplikasi_shopii/consts/colors.dart';
import 'package:aplikasi_shopii/consts/my_icons.dart';
import 'package:aplikasi_shopii/widget/cart/cart_empty.dart';
import 'package:aplikasi_shopii/widget/cart/cart_full.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/typicons_icons.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  static const routeName = '/cart-screen';

  @override
  Widget build(BuildContext context) {
    List product = [];
    return !product.isEmpty
        ? Scaffold(
            body: SafeArea(child: CartEmpty()),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text('Cart Items Count '),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(MyIcons.trash),
                ),
              ],
            ),
            body: SafeArea(
              child: Container(
                padding: const EdgeInsets.only(bottom: 62),
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, int indext) {
                    return CartFull();
                  },
                ),
              ),
            ),
            bottomSheet: checkoutSection(context),
          );
  }

  Widget checkoutSection(BuildContext ctx) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  gradient: LinearGradient(
                    colors: [
                      MyColors.gradientFStart,
                      MyColors.gradientFEnd,
                    ],
                    stops: [
                      0.0,
                      0.7,
                    ],
                  ),
                ),
                child: Material(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(8.0),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Checkout',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          // color: Theme.of(ctx).textSelectionColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            const Text(
              'Total ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '\$450.0',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(ctx).textSelectionColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
