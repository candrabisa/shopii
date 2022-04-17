import 'package:aplikasi_shopii/base/bottom_bar.dart';
import 'package:aplikasi_shopii/helpers/theme_pref.dart';
import 'package:aplikasi_shopii/inner_screens/brands_navigation_rail.dart';
import 'package:aplikasi_shopii/inner_screens/categories_feed.dart';
import 'package:aplikasi_shopii/inner_screens/product_detail.dart';
import 'package:aplikasi_shopii/providers/product_provider.dart';
import 'package:aplikasi_shopii/providers/theme_provider.dart';
import 'package:aplikasi_shopii/screens/cart_screen.dart';
import 'package:aplikasi_shopii/screens/feed_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'consts/theme_manager.dart';
import 'screens/wishlist_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeDarkProvider themeDarkProvider = ThemeDarkProvider();

  void getCurrentAppTheme() async {
    themeDarkProvider.darkTheme =
        await themeDarkProvider.themeDarkPreferences.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return themeDarkProvider;
          },
        ),
        ChangeNotifierProvider(
          create: (_) {
            return ProductProvider();
          },
        ),
        
      ],
      child: Consumer<ThemeDarkProvider>(builder: (context, themeData, child) {
        return MaterialApp(
          title: 'Flutter App',
          theme: ThemeStyles.themeData(themeDarkProvider.darkTheme, context),
          home: const BottomBarScreen(),
          routes: {
            BrandNavigationRailScreen.routeName: (context) =>
                const BrandNavigationRailScreen(),
            FeedScreen.routeName: (context) => FeedScreen(),
            CartScreen.routeName: (context) => const CartScreen(),
            WishlistScreen.routeName: (context) => const WishlistScreen(),
            ProductDetailScreen.routeName: (context) =>
                const ProductDetailScreen(),
            CategoriesFeedScreen.routeName: (context) => CategoriesFeedScreen(),
            // '/upload-product-from-screen': (context) => const Uploa
          },
        );
      }),
    );
  }
}
