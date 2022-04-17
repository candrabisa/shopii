import 'package:aplikasi_shopii/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishlistFul extends StatefulWidget {
  final String? productId;

  const WishlistFul({Key? key, this.productId}) : super(key: key);

  @override
  State<WishlistFul> createState() => _WishlistFulState();
}

class _WishlistFulState extends State<WishlistFul> {
  @override
  Widget build(BuildContext context) {
    // final favsAttr = Provider.of<FavsAttr>(context);
    return Stack(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(10, 6, 25, 4),
          child: Material(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(5.0),
            elevation: 3.0,
            child: InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(
                      height: 80.0,
                      child: Image.network(
                          'https://abong.com.bd/public//admin/media/2020/03/yellow_mesh_men_sport_sneaker_shoesjpeg_20200307141459.jpeg'),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'title',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            '\$16',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        positionedRemove(),
      ],
    );
  }

  Widget positionedRemove() {
    return Positioned(
      top: 30,
      right: 15,
      child: Container(
        height: 30,
        width: 30,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          padding: const EdgeInsets.all(0.0),
          color: MyColors.favColor,
          child: const Icon(
            Icons.clear,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
