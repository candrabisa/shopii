import 'package:aplikasi_shopii/consts/colors.dart';
import 'package:aplikasi_shopii/providers/theme_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:provider/provider.dart';

class CartFull extends StatefulWidget {
  const CartFull({Key? key}) : super(key: key);

  @override
  _CartFullState createState() => _CartFullState();
}

class _CartFullState extends State<CartFull> {
  @override
  Widget build(BuildContext context) {
    final themeDarkProvider = Provider.of<ThemeDarkProvider>(context);
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 6),
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).backgroundColor,
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://cdn.kibrispdr.org/data/smartwatch-png-0.png',
                ),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Text(
                          'Title Product',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(12),
                          // splashColor: Colors.blueAccent,
                          child: Container(
                            height: 50,
                            width: 50,
                            child: const Icon(
                              Icons.close,
                              color: Colors.red,
                              size: 22,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Text(
                        'Price:',
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        '\$450',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Sub Total:',
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        '\$450',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: themeDarkProvider.darkTheme
                              ? Colors.amberAccent
                              : Theme.of(context).accentColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Ships Free ',
                      ),
                      Spacer(),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(4),
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(
                              Entypo.minus,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.08,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          gradient: LinearGradient(
                            colors: [
                              MyColors.gradientFStart,
                              MyColors.gradientFEnd
                            ],
                            stops: const [0.0, 0.7],
                          ),
                        ),
                        child: const Text(
                          '1',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(4),
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(
                              Entypo.plus,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
