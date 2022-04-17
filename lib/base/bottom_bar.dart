import 'package:aplikasi_shopii/consts/my_icons.dart';
import 'package:aplikasi_shopii/providers/theme_provider.dart';
import 'package:aplikasi_shopii/screens/cart_screen.dart';
import 'package:aplikasi_shopii/screens/feed_screen.dart';
import 'package:aplikasi_shopii/screens/home_screen.dart';
import 'package:aplikasi_shopii/screens/profile_screen.dart';
import 'package:aplikasi_shopii/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);
  static const routeName = '/BottomBarScreen';

  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  List? _pages;

  // var _pages;
  int _selectedIndex = 0;

  @override
  void initState() {
    _pages = [
      HomeScreen(),
      FeedScreen(),
      SearchScreen(),
      CartScreen(),
      ProfileScreen(),
    ];
    // _pages = [
    //   {
    //     'page': HomeScreen(),
    //     'title': 'Home Screen',
    //   },
    //   {
    //     'page': FeedScreen(),
    //     'title': 'Feed Screen',
    //   },
    //   {
    //     'page': SearchScreen(),
    //     'title': 'Search Screen',
    //   },
    //   {
    //     'page': CartScreen(),
    //     'title': 'Cart Screen',
    //   },
    //   {
    //     'page': ProfileScreen(),
    //     'title': 'Profile Screen',
    //   }
    // ];
    super.initState();
  }

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeDarkProvider themeDarkProvider =
        Provider.of<ThemeDarkProvider>(context);
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text(_pages[_selectedIndex]['title']),
      // ),
      // body: _pages![_selectedIndex]['page'],
      body: _pages![_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        notchMargin: 3,
        clipBehavior: Clip.antiAlias,
        // elevation: 5,
        shape: CircularNotchedRectangle(),
        child: Container(
          // height: kBottomNavigationBarHeight*0.8,
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                width: 0.5,
                color: Colors.grey,
              ),
            ),
          ),
          child: BottomNavigationBar(
            onTap: _selectedPage,
            backgroundColor: Theme.of(context).primaryColor,
            unselectedItemColor: themeDarkProvider.darkTheme
                ? Colors.white
                : Theme.of(context).disabledColor,
            selectedItemColor: Colors.purple,
            selectedLabelStyle: const TextStyle(fontSize: 10),
            currentIndex: _selectedIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(MyIcons.home),
                tooltip: 'Home',
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(MyIcons.rss),
                tooltip: 'Feed',
                label: 'Feed',
              ),
              const BottomNavigationBarItem(
                activeIcon: null,
                icon: Icon(null
                    // Icons.search,
                    // color: Colors.transparent,
                    ),
                tooltip: 'Search',
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(MyIcons.bag),
                tooltip: 'Cart',
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(MyIcons.user),
                tooltip: 'Profile',
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        tooltip: 'Search',
        elevation: 5,
        child: Icon(MyIcons.search),
        onPressed: () {
          setState(() {
            _selectedIndex = 2;
          });
        },
      ),
    );
  }
}
