import 'package:aplikasi_shopii/consts/colors.dart';
import 'package:aplikasi_shopii/models/product_model.dart';
import 'package:aplikasi_shopii/providers/product_provider.dart';
import 'package:aplikasi_shopii/screens/feed_screen.dart';
import 'package:aplikasi_shopii/widget/backlayer.dart';
import 'package:aplikasi_shopii/widget/category.dart';
import 'package:aplikasi_shopii/widget/popular_products.dart';
import 'package:aplikasi_shopii/inner_screens/brands_navigation_rail.dart';
import 'package:backdrop/backdrop.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  // get imgList => null;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> imgList = [
    'https://www.wpexplorer.com/wp-content/uploads/laptop-blogger-typing.jpg',
    'https://www.wpexplorer.com/wp-content/uploads/high-price-of-free-plugins.png',
    'https://www.wpexplorer.com/wp-content/uploads/wordpress-woocommerce-ecommerce-plugins.jpg',
    'https://www.wpexplorer.com/wp-content/uploads/customer-support-e1455829271333.jpg',
  ];

  List<dynamic> imgListPopularBrand = [
    'assets/images/addidas.jpg',
    'assets/images/apple.jpg',
    'assets/images/dell.jpg',
    'assets/images/h&m.jpg',
    'assets/images/nike.jpg',
    'assets/images/samsung.jpg',
    'assets/images/huawei.jpg',
  ];

  int currentIndex = 0;

  final CarouselController controllerCarousel = CarouselController();

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductProvider>(context);
    final popularItems = productsData.popularProducts;
    print('popular items leng ${popularItems.length}');
    int index = -1;
    return Scaffold(
      body: Center(
        child: BackdropScaffold(
          frontLayerBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
          headerHeight: MediaQuery.of(context).size.height * 0.25,
          appBar: BackdropAppBar(
            title: const Text('Home'),
            leading: const BackdropToggleButton(
              icon: AnimatedIcons.home_menu,
            ),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [MyColors.starterColor, MyColors.endColor],
                ),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                padding: const EdgeInsets.all(10),
                icon: const CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white24,
                  child: CircleAvatar(
                    radius: 13,
                    backgroundImage: NetworkImage(
                      'https://www.freepnglogos.com/uploads/darth-vader-png/vector-profile-darth-vader-frames-illustrations-32.png',
                    ),
                  ),
                ),
              ),
            ],
          ),
          backLayer: BackLayerMenu(),
          frontLayer: SingleChildScrollView(
            child: Column(
              children: [
                CarouselSlider(
                  carouselController: controllerCarousel,
                  items: imgList
                      .map(
                        (image) => Container(
                          margin: const EdgeInsets.only(top: 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                                image: NetworkImage(image), fit: BoxFit.cover),
                          ),
                          // child: Image.network(
                          //   image,
                          //   width: double.infinity,
                          //   height: 360,
                          //   fit: BoxFit.cover,
                          // ),
                        ),
                      )
                      .toList(),
                  options: CarouselOptions(
                      autoPlay: true,
                      enableInfiniteScroll: true,
                      enlargeCenterPage: true,
                      aspectRatio: 2.0,
                      initialPage: 0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      }),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imgList.map(
                    (e) {
                      index++;
                      return indicator(
                        index,
                      );
                    },
                  ).toList(),
                ),

                //categories
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Text(
                                'Categories',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 150,
                      // padding: const EdgeInsets.only(left: 8.0),
                      child: ListView.builder(
                        itemCount: imgList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext ctx, int indexx) {
                          return CategoryWidget(index: indexx);
                        },
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text(
                        'Popular Brands',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                      const Spacer(),
                      FlatButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            BrandNavigationRailScreen.routeName,
                            arguments: {
                              7,
                            },
                          );
                        },
                        child: const Text(
                          'View all...',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 160,
                  width: double.infinity,
                  child: Swiper(
                    itemBuilder: (context, int indexx) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          color: Colors.white,
                          child: Image.asset(
                            imgListPopularBrand[indexx],
                            fit: BoxFit.contain,
                          ),
                        ),
                        // child: Image.asset(
                        //   imgListPopularBrand[indexx],
                        //   fit: BoxFit.cover,
                        // ),
                      );
                    },
                    itemCount: imgListPopularBrand.length,
                    viewportFraction: 0.85,
                    scale: 0.9,
                    autoplay: true,
                    onTap: (index) {
                      Navigator.of(context).pushNamed(
                        BrandNavigationRailScreen.routeName,
                        arguments: {
                          index,
                        },
                      );
                    },
                    // control: SwiperControl(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text(
                        'Popular Product',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                      const Spacer(),
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                            FeedScreen.routeName,
                            arguments: 'popular',
                          );
                        },
                        child: const Text(
                          'View all...',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 285,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: popularItems.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      return ChangeNotifierProvider.value(
                        value: popularItems[index],
                        child: PopularProduct(),
                        // imageUrl: popularItems[index].imageUrl,
                        // description: popularItems[index].description,
                        // price: popularItems[index].price,
                        // title: popularItems[index].title,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget indicator(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      width: currentIndex == index ? 12 : 4,
      height: 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: currentIndex == index
            ? Theme.of(context).accentColor
            : const Color(0xffc4c4c4),
      ),
    );
  }
}
