import 'package:aplikasi_shopii/consts/colors.dart';
import 'package:aplikasi_shopii/consts/my_icons.dart';
import 'package:aplikasi_shopii/providers/theme_provider.dart';
import 'package:aplikasi_shopii/screens/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ScrollController _scrollController;
  var top = 0.0;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeDarkProvider>(context);

    List<IconData> _userIconList = [
      Icons.email,
      Icons.phone,
      Icons.local_shipping,
      Icons.watch_later,
      Icons.exit_to_app_rounded,
      Icons.favorite,
    ];

    Widget _fabCamera() {
      //starting fab position
      final double defaultTopMargin = 180.0 - 4.0;
      //pixels from top where scaling should start
      final double scaleStart = 180.0;
      //pixelfrom top where scaling should end
      final double scaleEnd = scaleStart / 2;

      double top = defaultTopMargin;
      double scale = 1.0;
      if (_scrollController.hasClients) {
        double offset = _scrollController.offset;
        top -= offset;
        if (offset < defaultTopMargin - scaleStart) {
          scale = 1.0;
        } else if (offset < defaultTopMargin - scaleEnd) {
          scale = (defaultTopMargin - scaleEnd - offset) / scaleEnd;
        } else {
          scale = 0.0;
        }
      }
      return Positioned(
        top: top,
        right: 16.0,
        child: Transform(
          transform: Matrix4.identity()..scale(scale),
          alignment: Alignment.center,
          child: FloatingActionButton(
            heroTag: "btn1",
            child: const Icon(Icons.camera_alt_outlined),
            onPressed: () {},
          ),
        ),
      );
    }

    Widget userMenuTitle(String title) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      );
    }

    Widget userMenuList(String title, String subtitle, int index) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Theme.of(context).splashColor,
          child: ListTile(
            onTap: () {},
            title: Text(title),
            subtitle: Text(subtitle),
            leading: Icon(_userIconList[index]),
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  elevation: 4,
                  expandedHeight: 200,
                  pinned: true,
                  flexibleSpace: LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraint) {
                      top = constraint.biggest.height;
                      return Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              MyColors.starterColor,
                              MyColors.endColor,
                            ],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 0.0),
                            stops: const [0.0, 0.1],
                            tileMode: TileMode.clamp,
                          ),
                        ),
                        child: FlexibleSpaceBar(
                          collapseMode: CollapseMode.parallax,
                          centerTitle: true,
                          title: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AnimatedOpacity(
                                opacity: top <= 110.0 ? 1.0 : 0,
                                duration: Duration(milliseconds: 300),
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Container(
                                      height: kToolbarHeight / 1.8,
                                      width: kToolbarHeight / 1.8,
                                      decoration: const BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.white,
                                            blurRadius: 1.0,
                                          ),
                                        ],
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                              'https://www.freepnglogos.com/uploads/darth-vader-png/vector-profile-darth-vader-frames-illustrations-32.png'),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    const Text(
                                      'Guest',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          background: const Image(
                            image: NetworkImage(
                                'https://www.freepnglogos.com/uploads/darth-vader-png/vector-profile-darth-vader-frames-illustrations-32.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: userMenuTitle('User Bag'),
                      ),
                      const Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Theme.of(context).splashColor,
                          child: ListTile(
                            onTap: () => Navigator.of(context)
                                .pushNamed(WishlistScreen.routeName),
                            title: const Text('Wishlist'),
                            trailing: Icon(Icons.chevron_right_rounded),
                            leading: Icon(MyIcons.wishlist),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: userMenuTitle('User Information'),
                      ),
                      const Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                      userMenuList('Email', 'Email sub', 0),
                      userMenuList('Phone Number', '621821', 1),
                      userMenuList('Shipping Address', 'bekasi raya', 2),
                      userMenuList('Joined Date', 'Date', 3),
                      userMenuList('Wishlist', 'wishlist', 5),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: userMenuTitle('Settings'),
                      ),
                      const Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                      ListTileSwitch(
                        value: themeChange.darkTheme,
                        onChanged: (value) {
                          setState(() {
                            themeChange.darkTheme = value;
                          });
                        },
                        visualDensity: VisualDensity.comfortable,
                        switchType: SwitchType.cupertino,
                        switchActiveColor: Colors.indigo,
                        leading: const Icon(FontAwesome5.moon),
                        title: Text('Dark Theme'),
                      ),
                      userMenuList('Logout', '', 4),
                    ],
                  ),
                ),
              ],
            ),
            _fabCamera(),
          ],
        ),
      ),
    );
  }
}
